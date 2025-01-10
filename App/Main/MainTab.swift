//
//  MainTab.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import SwiftUI

enum MainTab: CaseIterable {
	case spiders
	case species
	case settings

	var title: String {
		switch self {
		case .spiders: "My spiders"
		case .species: "Species"
		case .settings: "Settings"
		}
	}

	var icon: String {
		switch self {
		case .spiders: "ant"
		case .species: "ant"
		case .settings: "gear"
		}
	}

	@ViewBuilder
	var view: some View {
		switch self {
		case .spiders: Text("Spiders")
		case .species: SpeciesScreen()
		case .settings: SettingsScreen()
		}
	}
}
