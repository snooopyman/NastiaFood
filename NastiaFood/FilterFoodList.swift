//
//  FilterFoodList.swift
//  NastiaFood
//
//  Created by Armando Cáceres on 26/8/24.
//

import SwiftUI
import SwiftData

struct FilteredFoodList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            FoodList(nameFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a food")
                .navigationTitle("Food")
        }
    }
}

#Preview {
    FilteredFoodList()
        .modelContainer(for: Food.self, inMemory: true)
}
