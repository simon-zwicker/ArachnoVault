//
//  SpeciesService.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import Foundation

struct SpeciesService {

	func fetch() async -> [Specie] {
		do {
			let data = try await Network.request(ArrayJSON<SpecieJSON>.self, endpoint: .speciesFetch)
			return await SpeciesAdapter.objects(data.items)
		} catch let error as LocalizedError {
			print(error.complete)
			return []
		}
	}

	func fetchCreated() async -> [SpecieNewJSON] {
		do {
			let data = try await Network.request(ArrayJSON<SpecieNewJSON>.self, endpoint: .specieCreated)
			return data.items
		} catch let error as LocalizedError {
			print(error.complete)
			return []
		}
	}

	func create(_ draft: SpecieDraft) async {
		do {
			_ = try await Network.request(SpecieNewJSON.self, endpoint: .specieCreate(draft))
		} catch let error as LocalizedError {
			print(error.complete)
		}
	}
}
