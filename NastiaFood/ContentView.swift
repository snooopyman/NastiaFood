//
//  ContentView.swift
//  NastiaFood
//
//  Created by Armando Cáceres on 26/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        TabView {
            FoodList()
//                .tabItem {
//                    Label("Food", systemImage: "fork.knife")
//                }
//        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
