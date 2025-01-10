//
//  FloatingTextFieldType.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import SwiftUI

enum FloatingTextFieldType {
	case email
	case password
	case name

	var keyboard: UIKeyboardType {
		switch self {
		case .email: .emailAddress
		default: .default
		}
	}

	var textCase: Text.Case? {
		switch self {
		case .email: .lowercase
		default: nil
		}
	}
}
