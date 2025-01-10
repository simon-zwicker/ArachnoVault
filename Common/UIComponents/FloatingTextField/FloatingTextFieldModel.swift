//
//  FloatingTextFieldModel.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import SwiftUI

final class FloatingTextFieldModel: ObservableObject {

	var placeholder: String
	var trailingIcon: String?
	@Published var isEditing: Bool = false
	@Published var rectBackground: Color = .black.opacity(0.1)
	@Published var rectLineWidth: CGFloat = 0
	@Published var shouldPlaceholderMove: Bool = false
	@Published var placeholderEdgeInset: EdgeInsets = .init()

	init(placeholder: String, trailingIcon: String? = nil) {
		self.placeholder = placeholder
		self.trailingIcon = trailingIcon
	}

	func isEditing(_ edit: Bool) {
		isEditing = edit
		rectBackground = edit ? .clear: .black.opacity(0.1)
		rectLineWidth = edit ? 1: 0
		shouldPlaceholderMove = edit
		placeholderEdgeInset = shouldPlaceholderMove ? .init(top: 0, leading: 15, bottom: 50, trailing: 0): .init(top: 0, leading: 15, bottom: 0, trailing: 0)
	}
}
