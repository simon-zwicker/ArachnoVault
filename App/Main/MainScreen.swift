//
//  MainScreen.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import SwiftUI

struct MainScreen: View {

	@StateObject private var model: MainModel = .init()

	var body: some View {
		TabView(selection: $model.activeTab) {
			ForEach(model.tabs, id: \.self) { tab in
				Tab(tab.title, systemImage: tab.icon, value: tab) {
					tab.view
				}
			}
		}
	}
}

#Preview {
	MainScreen()
}
