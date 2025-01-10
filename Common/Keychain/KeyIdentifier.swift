//
//  KeyIdentifier.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

enum KeyIdentifier: CaseIterable {
	case userCredentials

	var identifier: String {
		"\(key).\(KeyManager.shared.environment)"
	}

	private var key: String {
		switch self {
		case .userCredentials: "arachnovault.user.credentials"
		}
	}
}
