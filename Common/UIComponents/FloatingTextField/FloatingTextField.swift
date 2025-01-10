//
//  FloatingTextField.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import SwiftUI

struct FloatingTextField: View {

	@StateObject var model: FloatingTextFieldModel
	@Binding var input: String
	@FocusState var focus: Bool
	@Binding var isFocused: Bool
	let type: FloatingTextFieldType

	var body: some View {
		ZStack(alignment: .leading) {
			HStack {
				if type == .password {
					SecureField(model.placeholder, text: $input)
						.focused($focus)
						.onChange(of: focus) { _, newValue in
							model.isEditing(newValue)
						}
						.foregroundStyle(.primary)
						.animation(.easeInOut(duration: 0.4), value: focus)
						.frame(alignment: .leading)
						.keyboardType(type.keyboard)
						.textCase(type.textCase)
				} else {
					TextField(model.placeholder, text: $input)
						.focused($focus)
						.onChange(of: focus) { _, newValue in
							model.isEditing(newValue)
						}
						.foregroundStyle(.primary)
						.animation(.easeInOut(duration: 0.4), value: focus)
						.frame(alignment: .leading)
						.keyboardType(type.keyboard)
						.textCase(type.textCase)
				}

				if let trailingIcon = model.trailingIcon {
					Image(systemName: trailingIcon)
				}
			}
			.padding()
			.background(model.rectBackground)
			.clipShape(.rect(cornerRadius: 8))
			.overlay {
				RoundedRectangle(cornerRadius: 8)
					.stroke(lineWidth: model.rectLineWidth)
			}

			Text(focus ? " " + model.placeholder + " " : "")
				.foregroundColor(.secondary)
				.scaleEffect(model.shouldPlaceholderMove ? 1.0 : 1.2)
				.animation(.easeInOut(duration: 0.4), value: model.shouldPlaceholderMove)
				.background(Color(UIColor.systemBackground))
				.padding(model.placeholderEdgeInset)
		}
	}
}
