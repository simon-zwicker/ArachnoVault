//
//  Network.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation
import Mammut

struct Network {

	static private var env: NetworkEnvironment = .production
	static private var api: Mammut {
		.init(components: env.components, loglevel: .debug)
	}

	static func request<T: Codable>(
		_ T: T.Type,
		env: NetworkEnvironment = .production,
		endpoint: AVEndpoint
	) async throws(MammutError) -> T {
		self.env = env
		let result = await req(T.self, endpoint)

		switch result {
		case .success(let result): return result
		case .failure(let failure): throw failure.self
		}
	}

	static private func req<T: Codable>(
		_ T: T.Type,
		_ endpoint: AVEndpoint
	) async -> Result<T, MammutError> {
		await api.request(endpoint, error: ErrorJSON.self)
	}

	static func imageUrl(collection: String, id: String, filename: String) -> URL? {
		let urlString = "https://venomtrack.pockethost.io/api/files/\(collection)/\(id)/\(filename)"
		return URL(string: urlString)
	}
}
