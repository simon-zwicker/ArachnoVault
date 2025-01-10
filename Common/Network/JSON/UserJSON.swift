//
//  UserJSON.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation

struct UserJSON: Codable {
	let collectionId: String
	let collectionName: String
	let id: String
	let email: String?
	let emailVisibility: Bool
	let verified: Bool
	let name: String
	let avatar: String
	let created: String
	let updated: String
}
