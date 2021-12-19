//
//  TabView.swift
//  SliderTabBar
//
//  Created by KaKui on 19/12/2021.
//

import SwiftUI

struct TabView: View {
	let title: String
	
	let namespace: Namespace.ID
	
	@Binding var selectedIndex: Int
	
	var body: some View {
		Text(title)
			.font(.title2)
			.bold()
			.padding()
			.overlay(
				Capsule()
					.fill(Color.black)
					.overlay(
						Color.white.matchedGeometryEffect(id: selectedIndex, in: namespace, isSource: false)
					)
			)
			.mask {
				Text(title)
					.font(.title2)
					.bold()
					.padding()
			}
	}
}
