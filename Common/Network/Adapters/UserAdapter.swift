//
//  UserAdapter.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation

struct UserAdapter: AdapterProtocol {

	static func object(_ raw: UserJSON) -> User {
		.init(
			id: raw.id,
			username: raw.name,
			email: raw.email ?? "",
			created: raw.created.toDate ?? .now,
			updated: raw.updated.toDate ?? .now,
			token: nil
		)
	}
}
