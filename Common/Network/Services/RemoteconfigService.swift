//
//  RemoteconfigService.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import Foundation

struct RemoteconfigService {

	func fetch() async -> [RemoteconfigJSON] {
		do {
			let data = try await Network.request(ArrayJSON<RemoteconfigJSON>.self, endpoint: .remoteconfig)
			return data.items
		} catch let error as LocalizedError {
			print(error.complete)
			return []
		}
	}
}
