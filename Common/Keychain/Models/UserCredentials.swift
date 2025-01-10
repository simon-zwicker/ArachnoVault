//
//  UserCredentials.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 09.01.25.
//

struct UserCredentials: Codable {
	var userId: String?
	var username: String?
	var password: String?
	var email: String?
	var token: String?
	var tokenExp: Double?
}
