//
//  UserService.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation

struct UserService {

	func create(_ draft: RegisterDraft) async -> User? {
		do {
			let data = try await Network.request(UserJSON.self, endpoint: .register(draft))
			return UserAdapter.object(data)
		} catch let error as LocalizedError {
			print(error.complete)
			return nil
		}
	}

	func authentication(_ draft: LoginDraft) async -> User? {
		do {
			let data = try await Network.request(TokenJSON.self, endpoint: .authentication(draft))
			return TokenAdapter.object(data)
		} catch let error as LocalizedError {
			print(error.complete)
			return nil
		}
	}
}
