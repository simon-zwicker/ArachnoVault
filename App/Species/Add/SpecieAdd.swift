//
//  SpecieAdd.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 14.01.25.
//

import SwiftUI

struct SpecieAdd: View {

	@EnvironmentObject private var model: SpeciesModel
	@FocusState private var focusName: FloatingTextFieldType?

	var body: some View {
		VStack(spacing: 30) {
			Text("Bitte gebe den wissenschaftlichen Namen und die Lebensart an. Deine Anfrage wird innerhalb weniger Tage bearbeitet. Vielen dank für die Unterstützung!")
				.font(.Bold.regular)

			FloatingTextField(
				model: .init(placeholder: "Name"),
				input: $model.specieDraft.name,
				isFocused: .init(
					get: { focusName  == .name },
					set: {
						focusName = $0 ? .name: nil
						focusName = nil
					}
				),
				type: .email
			)

			HStack {
				ForEach(SpecieLifeStyle.allCases, id: \.self) { lifestyle in
					VStack(spacing: 15.0) {
						lifestyle.image
						Text(lifestyle.title)
							.font(.Bold.regular)
							.foregroundStyle(.black)
					}
					.padding(20)
					.frame(maxWidth: .infinity)
					.background(
						RoundedRectangle(cornerRadius: 15)
							.fill(model.specieDraft.lifestyle == lifestyle ? lifestyle.color.opacity(0.3): .secondary.opacity(0.2))
							.stroke(model.specieDraft.lifestyle == lifestyle ? lifestyle.color: .clear, lineWidth: 3)
					)
					.button {
						model.specieDraft.lifestyle = lifestyle
					}
				}
			}

			Spacer()

			Text("Eintragen")
				.font(.headline)
				.frame(maxWidth: .infinity)
				.padding(15)
				.background(.blue)
				.foregroundStyle(.white)
				.clipShape(.rect(cornerRadius: 10))
				.button {

				}
		}
		.padding()
		.padding(.top, 30)
		.navigationTitle("Eintragung anfordern")
	}
}
