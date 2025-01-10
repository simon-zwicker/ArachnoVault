//
//  Root.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import SwiftUI

struct Root: View {

	@StateObject private var model: RootModel = .init()

	var body: some View {
		Group {
			if model.showMain {
				MainScreen()
			} else {
				AuthenticationScreen()
			}
		}
		.environmentObject(model)
		.onAppear {
			model.onAppear()
		}
	}
}

#Preview {
	Root()
}
