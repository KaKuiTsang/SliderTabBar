//
//  ContentView.swift
//  SliderTabBar
//
//  Created by KaKui on 15/12/2021.
//

import SwiftUI

struct ContentView: View {
	
	@Namespace var animation
	
	@State var selectedIndex = 0
	
	let products = [
		"iPhone 13 mini",
		" iPad Pro 12.9",
		"Macbook Pro 16\" M1 Max",
		"AirPod 3",
		"Apple Watch series 7 45mm"
	]
	
    var body: some View {
		VStack {
			ScrollView(.horizontal, showsIndicators: false) {
				ScrollViewReader { proxy in
					HStack {
						ForEach(products.indices, id:\.self) { index in
							TabView(title: products[index], namespace: animation, selectedIndex: $selectedIndex)
								.matchedGeometryEffect(id: index, in: animation)
								.id(index)
								
								.onTapGesture {
									withAnimation(.spring()) {
										selectedIndex = index
									}
								}
						}
					}
					.onChange(of: selectedIndex) { index in
						withAnimation(.spring()) {
							proxy.scrollTo(index, anchor: .center)
						}
					}
				}
	
			}
			.background(
				Capsule()
					.fill(Color.black)
					.matchedGeometryEffect(id: selectedIndex, in: animation, isSource: false)
			)
			
			Spacer()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
