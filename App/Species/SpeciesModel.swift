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
	@Published var specieDraft: SpecieDraft = .defaultValue
	@Published var showSpecieAdd: Bool = false

	private var created: [SpecieNewJSON] = []

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

	func showAddSpecies() {
		showSpecieAdd = true
	}

	func addSpecie() {
		Task {
			await service.create(specieDraft)
		}
	}

	private func fetch() async {
		self.items = await service.fetch()
		self.created = await service.fetchCreated()
	}
}
