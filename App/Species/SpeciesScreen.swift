//
//  SpeciesScreen.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import SwiftUI

struct SpeciesScreen: View {

	@StateObject private var model: SpeciesModel = .init()

	var species: [Specie] {
		if !model.searchText.isEmpty {
			return model.items.filter({ $0.name.lowercased().contains(model.searchText.lowercased()) })
		}
		return model.items
	}

	var body: some View {
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: model.columns) {
					ForEach(species, id: \.id) { specie in
						SpecieGridRow(specie: specie)
							.button {
								model.detail = specie
							}
					}
				}
			}
			.navigationTitle("Arten")
			.searchable(text: $model.searchText)
			.onAppear {
				model.onAppear()
			}
			.sheet(item: $model.detail) { specie in
				SpecieDetail(specie: specie)
			}
			.sheet(isPresented: $model.showSpecieAdd) {
				SpecieAdd()
					.presentationDetents([.medium])
			}
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Text("Eintragung anfordern")
						.button {
							model.addSpecie()
						}
				}
			}
			.environmentObject(model)
		}
	}
}
