//
//  AuthenticationModel.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation

@MainActor
final class AuthenticationModel: ObservableObject {

	@Published var authenticationType: AuthenticationType = .registration
	@Published var registerDraft: RegisterDraft = .defaultValue
	@Published var loginDraft: LoginDraft = .defaultValue

	let service: UserService = .init()

	func switchAuthenticationType() {
		authenticationType = authenticationType == .registration ? .login : .registration
	}

	func authButtonTapped(_ completion: @escaping (User?) -> Void) {
		if authenticationType == .registration {
			registerDraft.passwordConfirm = registerDraft.password

			Task {
				completion(await register())
			}
		} else {
			Task {
				completion(await login())
			}
		}
	}

	private func register() async -> User? {
		self.registerDraft.email = self.registerDraft.email.lowercased()
		_ = await service.create(registerDraft)
		self.loginDraft = LoginDraft(identity: registerDraft.email, password: registerDraft.password)
		return await login()
	}

	private func login() async -> User?  {
		self.loginDraft.identity = self.loginDraft.identity.lowercased()
		let authenticatedUser = await service.authentication(loginDraft)
		KeyManager.shared.authenticated(authenticatedUser, password: loginDraft.password)
		resetDrafts()
		return authenticatedUser
	}

	private func resetDrafts() {
		registerDraft = .defaultValue
		loginDraft = .defaultValue
	}
}
