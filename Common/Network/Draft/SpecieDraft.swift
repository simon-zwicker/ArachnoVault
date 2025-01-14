//
//  SpecieDraft.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 14.01.25.
//

struct SpecieDraft: Codable {
	var name: String
	var lifestyle: SpecieLifeStyle

	init(name: String, lifestyle: SpecieLifeStyle) {
		self.name = name
		self.lifestyle = lifestyle
	}

	static var defaultValue: Self {
		.init(name: "", lifestyle: .ground)
	}
}
