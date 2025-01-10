//
//  SettingsScreen.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import SwiftUI

struct SettingsScreen: View {

	@StateObject private var model: SettingsModel = .init()
	@EnvironmentObject private var rootModel: RootModel

	var body: some View {
		Text("Logout")
			.foregroundStyle(.red)
			.button {
				model.logout {
					rootModel.validateUser()
				}
			}
	}
}
