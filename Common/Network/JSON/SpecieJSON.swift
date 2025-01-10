//
//  SpecieJSON.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import Foundation

struct SpecieJSON: Codable {
	let id: String
	let name: String
	let lifestyle: SpecieLifeStyle
	let created: String
	let updated: String
	let collectionId: String
	let image: String
}
