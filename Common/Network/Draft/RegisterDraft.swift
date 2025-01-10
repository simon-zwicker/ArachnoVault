//
//  RegisterDraft.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

struct RegisterDraft: Codable {
	var email: String
	var name: String
	var password: String
	var passwordConfirm: String
	var emailVisibility: Bool

	init(email: String, name: String, password: String, passwordConfirm: String) {
		self.email = email.lowercased()
		self.name = name
		self.password = password
		self.passwordConfirm = passwordConfirm
		self.emailVisibility = true
	}

	static var defaultValue: Self {
		.init(email: "", name: "", password: "", passwordConfirm: "")
	}
}
