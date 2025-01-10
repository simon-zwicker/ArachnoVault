//
//  NetworkEnvironment.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import Foundation

enum NetworkEnvironment {
	case production

	var schema: String { "https" }
	var host: String { "venomtrack.pockethost.io" }
	var path: String { "/api/collections" }

	var components: URLComponents {
		var comp: URLComponents = .init()
		comp.scheme = schema
		comp.host = host
		comp.path = path
		return comp
	}
}
