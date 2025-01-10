//
//  AuthenticationScreen.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 08.01.25.
//

import SwiftUI
import Octopus

struct AuthenticationScreen: View {

	@StateObject private var model: AuthenticationModel = .init()
	@EnvironmentObject private var rootModel: RootModel
	@FocusState private var focusRegister: FloatingTextFieldType?
	@FocusState private var focusLogin: FloatingTextFieldType?

	var body: some View {
		NavigationStack {
			VStack {
				VStack(spacing: 10) {
					if model.authenticationType == .login {
						FloatingTextField(
							model: .init(placeholder: "Email", trailingIcon: "envelope.fill"),
							input: $model.loginDraft.identity,
							isFocused: .init(
								get: { focusLogin  == .email },
								set: {
									focusLogin = $0 ? .email: nil
									focusRegister = nil
								}),
							type: .email
						)
						FloatingTextField(
							model: .init(placeholder: "Password", trailingIcon: "key.fill"),
							input: $model.loginDraft.password,
							isFocused: .init(
								get: { focusLogin  == .password },
								set: {
									focusLogin = $0 ? .password: nil
									focusRegister = nil
								}),
							type: .password
						)
					} else {
						FloatingTextField(
							model: .init(placeholder: "Email", trailingIcon: "envelope.fill"),
							input: $model.registerDraft.email,
							isFocused: .init(
								get: { focusRegister  == .email },
								set: {
									focusRegister = $0 ? .email: nil
									focusLogin = nil
								}),
							type: .email
						)
						FloatingTextField(
							model: .init(placeholder: "Password", trailingIcon: "key.fill"),
							input: $model.registerDraft.password,
							isFocused: .init(
								get: { focusRegister  == .password },
								set: {
									focusRegister = $0 ? .password: nil
									focusLogin = nil
								}),
							type: .password
						)
						FloatingTextField(
							model: .init(placeholder: "Username", trailingIcon: "person.fill"),
							input: $model.registerDraft.name,
							isFocused: .init(
								get: { focusRegister  == .name },
								set: {
									focusRegister = $0 ? .name: nil
									focusLogin = nil
								}),
							type: .name
						)
					}

					Text(model.authenticationType.buttonText)
						.font(.headline)
						.frame(maxWidth: .infinity)
						.padding(15)
						.background(.blue)
						.foregroundStyle(.white)
						.clipShape(.rect(cornerRadius: 10))
						.button {
							model.authButtonTapped { user in
								rootModel.validateUser()
							}
						}
				}

				Spacer()

				VStack(spacing: 10) {
					Divider()
						.padding(.vertical, 20)

					Text(model.authenticationType.titleOther)
						.font(.caption)

					Text(model.authenticationType.buttonOther)
						.font(.subheadline.bold())
						.button {
							model.switchAuthenticationType()
						}
				}

				Spacer()
			}
			.padding()
			.navigationTitle(model.authenticationType.title)
		}
	}
}

#Preview {
	AuthenticationScreen()
}
