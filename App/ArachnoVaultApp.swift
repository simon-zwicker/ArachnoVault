//
//  ArachnoVaultApp.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import SwiftUI

@main
struct ArachnoVaultApp: App {

	@UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            Root()
        }
    }
}
