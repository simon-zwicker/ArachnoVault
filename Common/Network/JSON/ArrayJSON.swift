//
//  ArrayJSON.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import Foundation

struct ArrayJSON<T: Codable>: Codable {
	let page: Int
	let perPage: Int
	let totalPages: Int
	let totalItems: Int
	let items: [T]
}
