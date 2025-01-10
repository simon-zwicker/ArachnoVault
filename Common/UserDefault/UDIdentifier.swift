//
//  UDIdentifier.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

enum UDIdentifier: CaseIterable {
	case speciesData

	var identifier: String {
		"\(key).\(UDManager.shared.environment)"
	}

	var onlineIdentifier: String {
		"\(identifier).online"
	}

	private var key: String {
		switch self {
		case .speciesData: return "species.data"
		}
	}
}
