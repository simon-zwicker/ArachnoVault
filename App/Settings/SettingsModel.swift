//
//  SettingsModel.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import Foundation

@MainActor
final class SettingsModel: ObservableObject {

	func logout(_ completion: @escaping () -> Void) {
		KeyManager.shared.unauthenticate()
		completion()
	}
}
