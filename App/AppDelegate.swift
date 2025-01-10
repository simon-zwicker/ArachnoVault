//
//  AppDelegate.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
	) -> Bool {
		#if DEBUG
		KeyManager.shared.environment = .development
		UDManager.shared.environment = .development
		#endif

		return true
	}
}
