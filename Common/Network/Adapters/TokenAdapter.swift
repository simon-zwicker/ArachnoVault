//
//  TokenAdapter.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 09.01.25.
//

import Foundation
import Octopus

class TokenAdapter: AdapterProtocol {

	static func object(_ raw: TokenJSON) -> User {
		.init(
			id: raw.record.id,
			username: raw.record.name,
			email: raw.record.email ?? "",
			created: raw.record.created.toDate ?? .now,
			updated: raw.record.updated.toDate ?? .now,
			token: raw.token
		)
	}
}
