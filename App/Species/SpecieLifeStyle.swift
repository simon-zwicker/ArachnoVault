//
//  SpecieLifeStyle.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import SwiftUI

enum SpecieLifeStyle: Int, CaseIterable, Codable {
	case ground
	case tree
	case burrow

	var icon: String {
		switch self {
		case .ground: "camera.macro"
		case .tree: "tree.fill"
		case .burrow: "water.waves.and.arrow.trianglehead.down"
		}
	}

	var color: Color {
		switch self {
		case .ground: .brown
		case .tree: .green.darker()
		case .burrow: .brown.darker(by: 40)
		}
	}
}
