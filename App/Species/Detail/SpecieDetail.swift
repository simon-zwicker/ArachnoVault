//
//  SpecieDetail.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 13.01.25.
//

import SwiftUI

struct SpecieDetail: View {

	let specie: Specie
	let gradient: Gradient = Gradient(colors: [.red, .orange, .yellow, .green])
	@State var segmentSelected: Int = 0

	var minValueSize: Double {
		segmentSelected == 0 ? 1.5: 2
	}

	var maxValueSize: Double {
		segmentSelected == 0 ? 9: 12
	}

	var minValueSpan: Double {
		segmentSelected == 0 ? 1: 5
	}

	var maxValueSpan: Double {
		segmentSelected == 0 ? 7: 30
	}

	var bodyLength: Double {
		segmentSelected == 0 ? specie.bodylengthMale: specie.bodylengthFemale
	}

	var lifeSpan: Double {
		segmentSelected == 0 ? specie.lifespanMale: specie.lifespanFemale
	}

	var body: some View {
		VStack(alignment: .leading, spacing: 20.0) {
			Text(specie.name)
				.font(.Black.title5)

			VStack(alignment: .leading, spacing: 20) {
				Picker("", selection: $segmentSelected) {
					Text("Male").tag(0)
					Text("Female").tag(1)
				}
				.pickerStyle(.segmented)

				Divider()
					.padding(.vertical, 10)

				HStack {
					VStack(spacing: 15.0) {
						Text("Körperlänge")
							.font(.Black.regular)

						HStack {
							Text("\(minValueSize.formatted(.number))")
								.font(.Black.verySmall)
								.foregroundStyle(.secondary)
							Spacer()
							Text("\(bodyLength.formatted(.number)) cm")
								.font(.Bold.title)
							Spacer()
							Text("\(maxValueSize.formatted(.number))")
								.font(.Black.verySmall)
								.foregroundStyle(.secondary)
						}

						Gauge(value: bodyLength, in: minValueSize...maxValueSize) {
						}
						.gaugeStyle(.accessoryLinear)
						.tint(gradient)
					}
					.frame(maxWidth: .infinity)
					.padding(10)
					.background(
						RoundedRectangle(cornerRadius: 20)
							.fill(.black.opacity(0.1))
					)

					VStack(spacing: 15.0) {
						Text("Lebenserwartung")
							.font(.Black.regular)

						HStack {
							Text("\(minValueSpan.formatted(.number))")
								.font(.Black.verySmall)
								.foregroundStyle(.secondary)
							Spacer()
							Text("\(lifeSpan.formatted(.number)) Jahre")
								.font(.Bold.title)
							Spacer()
							Text("\(maxValueSpan.formatted(.number))")
								.font(.Black.verySmall)
								.foregroundStyle(.secondary)
						}

						Gauge(value: lifeSpan, in: minValueSpan...maxValueSpan) {

						}
						.gaugeStyle(.accessoryLinear)
						.tint(gradient)
					}
					.padding(10)
					.background(
						RoundedRectangle(cornerRadius: 20)
							.fill(.secondary.opacity(0.2))
					)
					.frame(maxWidth: .infinity)
				}
				.animation(.easeInOut, value: segmentSelected)

				Divider()
					.padding(.vertical, 10)

				HStack {
					VStack(spacing: 10) {
						Image(systemName: "sun.max.fill")
							.font(.Regular.regular)
							.foregroundStyle(.yellow.darker(by: 5))

						Text(specie.tempRangeDay)
							.font(.Bold.regular)
					}
					.frame(maxWidth: .infinity)
					.padding(10)
					.background(
						RoundedRectangle(cornerRadius: 20)
							.fill(.secondary.opacity(0.2))
					)
					.frame(maxWidth: .infinity)

					VStack(spacing: 10) {
						Image(systemName: "moon.fill")
							.font(.Regular.regular)
							.foregroundStyle(.purple.darker(by: 5))

						Text(specie.tempRangeNight)
							.font(.Bold.regular)
					}
					.frame(maxWidth: .infinity)
					.padding(10)
					.background(
						RoundedRectangle(cornerRadius: 20)
							.fill(.secondary.opacity(0.2))
					)
					.frame(maxWidth: .infinity)

					VStack(spacing: 10) {
						Image(systemName: "humidity.fill")
							.font(.Regular.regular)
							.foregroundStyle(.blue.darker(by: 5))

						Text(specie.humidity)
							.font(.Bold.regular)
					}
					.frame(maxWidth: .infinity)
					.padding(10)
					.background(
						RoundedRectangle(cornerRadius: 20)
							.fill(.secondary.opacity(0.2))
					)
					.frame(maxWidth: .infinity)
				}

				Divider()
					.padding(.vertical, 10)

				VStack(alignment: .leading, spacing: 10) {
					HStack(spacing: 10) {
						Image(systemName: "mappin.and.ellipse")
							.font(.Regular.regular)
							.foregroundStyle(.red)

						Text(specie.origin)
							.font(.Bold.regular)
					}

					HStack(spacing: 10) {
						Image(systemName: "shield.lefthalf.filled.trianglebadge.exclamationmark")
							.font(.Regular.regular)
							.foregroundStyle(.orange)

						Text(specie.conservationStatus)
							.font(.Bold.regular)
					}

					HStack(spacing: 10) {
						Image(systemName: "heart.fill")
							.font(.Regular.regular)
							.foregroundStyle(.pink)

						Text(specie.behavior)
							.font(.Bold.regular)
					}
				}
			}
			.frame(maxWidth: .infinity)

			Spacer()
		}
		.padding()
		.padding(.top, 30)
	}
}

#Preview {
	SpecieDetail(specie: Specie.preview)
}
