//
//  RootModel.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation
import Octopus

@MainActor
final class RootModel: ObservableObject {
	@Published private(set) var showMain: Bool = true
	private(set) var remoteconfig: [RemoteconfigJSON] = []
	let service: UserService = .init()
	let remoteconfigService: RemoteconfigService = .init()

	func onAppear() {
		fetchRemoteConfig()
		validateUser()
	}

	func validateUser() {
		Task {
			showMain = userExists() ? await validateJWT() : false
		}
	}

	private func userExists() -> Bool {
		KeyManager.shared.userCredentials != nil
	}

	private func validateJWT() async -> Bool {
		if KeyManager.shared.isJWTValid {
			return true
		}

		return await relogin()
	}

	private func relogin() async -> Bool {
		let userCredentials = KeyManager.shared.userCredentials
		let draft = LoginDraft(identity: userCredentials?.email ?? "", password: userCredentials?.password ?? "")
		let authenticatedUser = await service.authentication(draft)
		KeyManager.shared.authenticated(authenticatedUser, password: userCredentials?.password)
		return KeyManager.shared.isJWTValid
	}

	private func fetchRemoteConfig() {
		Task {
			self.remoteconfig = await remoteconfigService.fetch()
			persistOnlineRemoteconfig()
		}
	}

	private func persistOnlineRemoteconfig() {
		for config in remoteconfig {
			guard let ident = UDIdentifier.allCases.first(where: { $0.identifier == config.key }) else { continue }
			UDManager.shared.setOnlineVersion(for: ident, value: config.version)
		}
	}
}
