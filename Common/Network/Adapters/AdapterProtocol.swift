//
//  AdapterProtocol.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

protocol AdapterProtocol {
	associatedtype ItemJSON
	associatedtype Item

	static func objects(_ raw: [ItemJSON]) async -> [Item]
	static func object(_ raw: ItemJSON) -> Item
}

extension AdapterProtocol {
	static func objects(_ raw: [ItemJSON]) async -> [Item] {
		raw.compactMap({ object($0) })
	}
}
