//
//  SpecieGridRow.swift
//  ArachnoVault
//
//  Created by Simon Zwicker on 10.01.25.
//

import SwiftUI
import Kingfisher

struct SpecieGridRow: View {
	let specie: Specie

	var body: some View {
		ZStack(alignment: .bottom) {
			KFImage(specie.imageURL)
				.resizable()
				.targetCache(.default)
				.cacheOriginalImage()
				.fade(duration: 0.25)

			Text(specie.name)
				.font(.system(size: 16.0, weight: .black))
				.foregroundStyle(.black)
				.frame(maxWidth: .infinity, minHeight: 40)
				.padding(.vertical, 10)
				.background(.white.opacity(0.8))

			Image(systemName: specie.lifestyle.icon)
				.foregroundStyle(.white)
				.padding(8)
				.background(
					Circle()
						.fill(specie.lifestyle.color)
						.stroke(.white, lineWidth: 2)
						.shadow(radius: 3)
				)
				.position(x: 25, y: 25)
		}
		.frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: 200)
		.clipShape(.rect(cornerRadius: 15))
	}
}
