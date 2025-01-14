//
//  AVEndpoint.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation
import Mammut

enum AVEndpoint {

	/// RemoteConfig
	case remoteconfig

	/// User
	case register(RegisterDraft)
	case authentication(LoginDraft)

	/// Species
	case speciesFetch
	case specieCreate(SpecieDraft)
	case specieCreated
}

extension AVEndpoint: Endpoint {

	var path: String {
		switch self {
		case .remoteconfig: "/remoteconfig/records"
		case .register: "/users/records"
		case .authentication: "/users/auth-with-password"
		case .speciesFetch: "/species/records"
		case .specieCreated, .specieCreate: "/specieNew/records"
		}
	}

	var method: MammutMethod {
		switch self {
		case .register, .authentication, .specieCreate: .post
		default: .get
		}
	}

	var headers: [MammutHeader] {
		var headers: [MammutHeader] = .init()
		headers.append(.content(.type("application/json")))
		return headers
	}

	var parameters: [String : Any] {
		var params: [String : Any] = .init()
		switch self {
		case let .register(draft): params = draft.dictionary
		case let .authentication(draft): params = draft.dictionary
		case .speciesFetch, .specieCreated: params["sort"] = "name"
		case let .specieCreate(draft): params = draft.dictionary
		default: return params
		}
		return params
	}

	var parametersUrl: [String : Any] { [:] }

	var encoding: Encoding {
		switch self {
		case .register, .authentication, .specieCreate: .json
		default: .url
		}
	}
}
