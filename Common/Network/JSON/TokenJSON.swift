//
//  TokenJSON.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 09.01.25.
//

import Foundation

struct TokenJSON: Codable {
	let token: String
	let record: UserJSON
}
