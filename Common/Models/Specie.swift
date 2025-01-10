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
}
