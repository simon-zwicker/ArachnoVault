//
//  UDManager.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import Foundation

class UDManager {

	static var shared: UDManager = .init()

	var environment: KeyEnvironment = .production

	func getVersion(for ident: UDIdentifier) -> Int {
		UserDefaults.standard.integer(forKey: ident.identifier)
	}

	func setVersion(for ident: UDIdentifier, value: Int) {
		UserDefaults.standard.set(value, forKey: ident.identifier)
	}

	func getOnlineVersion(for ident: UDIdentifier) -> Int {
		UserDefaults.standard.integer(forKey: ident.onlineIdentifier)
	}

	func setOnlineVersion(for ident: UDIdentifier, value: Int) {
		UserDefaults.standard.set(value, forKey: ident.onlineIdentifier)
	}
}
