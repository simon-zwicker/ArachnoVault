//
//  SpeciesAdapter.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import Foundation
import Octopus

struct SpeciesAdapter: AdapterProtocol {

	static func object(_ raw: SpecieJSON) -> Specie {
		.init(
			id: raw.id,
			name: raw.name,
			lifestyle: raw.lifestyle,
			created: raw.created.toDate ?? .now,
			updated: raw.updated.toDate ?? .now,
			imageURL: Network.imageUrl(
				collection: raw.collectionId,
				id: raw.id,
				filename: raw.image
			),
			tempRangeDay: raw.tempRangeDay,
			tempRangeNight: raw.tempRangeNight,
			humidity: raw.humidity,
			origin: raw.origin,
			conservationStatus: raw.conservationStatus,
			lifespanMale: raw.lifespanMale,
			lifespanFemale: raw.lifespanFemale,
			bodylengthMale: raw.bodylengthMale,
			bodylengthFemale: raw.bodylengthFemale,
			behavior: raw.behavior
		)
	}
}
