//
//  SpeciesModel.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import SwiftUI

@MainActor
final class SpeciesModel: ObservableObject {

	@Published var searchText: String = ""
	@Published var items: [Specie] = []
	@Published var detail: Specie?
	
	let columns = [
		GridItem(.adaptive(minimum: 150)),
		GridItem(.adaptive(minimum: 150))
	]

	let service: SpeciesService = .init()

	func onAppear() {
		Task {
			await fetch()
		}
	}

	private func fetch() async {
		items = await service.fetch()
	}
}
