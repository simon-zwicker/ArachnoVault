//
//  MainModel.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation

@MainActor
final class MainModel: ObservableObject {
	@Published var activeTab: MainTab = .spiders
	let tabs: [MainTab] = MainTab.allCases
}
