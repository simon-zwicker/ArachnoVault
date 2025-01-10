//
//  LoginDraft.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

struct LoginDraft: Codable {
	var identity: String
	var password: String

	init(identity: String, password: String) {
		self.identity = identity.lowercased()
		self.password = password
	}

	static var defaultValue: Self {
		.init(identity: "", password: "")
	}
}
