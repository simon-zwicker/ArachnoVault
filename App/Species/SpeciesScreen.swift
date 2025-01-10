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
				VStack(alignment: .leading, spacing: 20.0) {
					Text(specie.name)
						.font(.largeTitle)

					VStack {
						Text("Male")
						HStack {
							VStack {
								Text("6-8 cm")
									.font(.system(size: 20, weight: .bold))
								Text("Körperlänge")
									.font(.system(size: 10))
							}
							.padding()
							.frame(maxWidth: .infinity)
							.background(
								RoundedRectangle(cornerRadius: 10)
									.fill(.gray.opacity(0.3))
							)

							VStack {
								Text("24-28 °C")
									.font(.system(size: 20, weight: .bold))
								Text("Temperatur")
									.font(.system(size: 10))
							}
							.padding()
							.frame(maxWidth: .infinity)
							.background(
								RoundedRectangle(cornerRadius: 10)
									.fill(.gray.opacity(0.3))
							)

							VStack {
								Text("50-80 %")
									.font(.system(size: 20, weight: .bold))
								Text("Luftfeuchtigkeit")
									.font(.system(size: 10))
							}
							.padding()
							.frame(maxWidth: .infinity)
							.background(
								RoundedRectangle(cornerRadius: 10)
									.fill(.gray.opacity(0.3))
							)
						}
					}

					Spacer()
				}
				.padding()
				.navigationTitle(specie.name)
				.presentationDetents([.medium])
			}
		}
	}
}
