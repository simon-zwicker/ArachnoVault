//
//  Specie.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import Foundation

struct Specie: Identifiable {
	let id: String
	let name: String
	let lifestyle: SpecieLifeStyle
	let created: Date
	let updated: Date
	let imageURL: URL?
	let tempRangeDay: String
	let tempRangeNight: String
	let humidity: String
	let origin: String
	let conservationStatus: String
	let lifespanMale: Double
	let lifespanFemale: Double
	let bodylengthMale: Double
	let bodylengthFemale: Double
	let behavior: String
}

extension Specie {
	static var preview: Self {
		.init(
			id: "h0q14634ph26d2x",
			name: "Acanthoscurria geniculata",
			lifestyle: .ground,
			created: .now,
			updated: .now,
			imageURL: URL(string: "https://venomtrack.pockethost.io/api/files/pbc_878479608/h0q14634ph26d2x/2_b762_eac_1654_452_b_bf53_ba8_d5262_dcb3_vt9gk7kbps.png"),
			tempRangeDay: "24-27 °C",
			tempRangeNight: "20-22 °C",
			humidity: "70-80 %",
			origin: "Südamerika (Brasilien)",
			conservationStatus: "nicht geschützt",
			lifespanMale: 5,
			lifespanFemale: 12,
			bodylengthMale: 9,
			bodylengthFemale: 9,
			behavior: "relativ friedlich"
		)
	}
}
