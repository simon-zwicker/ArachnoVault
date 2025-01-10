//
//  AuthenticationType.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

enum AuthenticationType: CaseIterable, Equatable {
	case registration
	case login

	var title: String {
		switch self {
		case .login: "Login"
		case .registration: "Registrieren"
		}
	}

	var titleOther: String {
		switch self {
		case .login: "Noch keinen Account? Dann jetzt registrieren!"
		case .registration: "Du hast bereits einen Account? Dann jetzt anmelden!"
		}
	}

	var buttonOther: String {
		switch self {
		case .login: "Account erstellen"
		case .registration: "Anmelden"
		}
	}

	var buttonText: String {
		switch self {
		case .login: "Anmelden"
		case .registration: "Erstellen"
		}
	}
}
