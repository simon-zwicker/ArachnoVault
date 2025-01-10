//
//  KeyManager.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation
import KeychainAccess
import Octopus

class KeyManager {

	static var shared = KeyManager()

	let keychain: Keychain = .init()
	var environment: KeyEnvironment = .production

	var userCredentials: UserCredentials? {
		get {
			guard let data = try? keychain.getData(KeyIdentifier.userCredentials.identifier) else { return nil }
			return try? data.decode(UserCredentials.self)
		}

		set {
			guard let newValue, let data = try? newValue.encode() else { return }
			try? keychain.set(data, key: KeyIdentifier.userCredentials.identifier)
		}
	}

	var isJWTValid: Bool {
		guard let userCredentials, userCredentials.token != nil, let tokenExp = userCredentials.tokenExp else { return false }
		return tokenExp > Date.now.timeIntervalSince1970
	}

	func authenticated(_ user: User?, password: String?) {
		guard let user else {
			userCredentials = nil
			return
		}
		var credentials = userCredentials ?? .init()
		credentials.userId = user.id
		credentials.email	= user.email
		credentials.token = user.token
		credentials.password = password
		credentials.username = user.username
		credentials.tokenExp = Date.now.change(6, for: .day)?.timeIntervalSince1970
		userCredentials = credentials
	}

	func unauthenticate() {
		try? keychain.remove(KeyIdentifier.userCredentials.identifier)
	}

	func _printKeys() {
		KeyIdentifier.allCases.forEach { print($0.identifier) }
	}

	func _printKeyValues() {
		keychain.allItems().forEach({
			print($0.count)
			print($0.keys)
			print($0.values)
		})
	}
}
