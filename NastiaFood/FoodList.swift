//
//  FoodList.swift
//  NastiaFood
//
//  Created by Armando Cáceres on 26/8/24.
//

import SwiftUI
import SwiftData

struct FoodList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Food.name) private var foods: [Food]
    
    @State private var searchText = ""
    @State private var newFood: Food?
    
    init(nameFilter: String = "") {
        let predicate = #Predicate<Food> { food in
            nameFilter.isEmpty || food.name.localizedStandardContains(nameFilter)
        }
        _foods = Query(filter: predicate, sort: \Food.name)
    }
    
    var filteredFoods: [Food] {
        foods.filter { searchText.isEmpty || $0.name.localizedStandardContains(searchText) }
    }
    
    var body: some View {
        NavigationSplitView {
            Group {
                if !filteredFoods.isEmpty {
                    List {
                        ForEach(filteredFoods) { food in
                            NavigationLink {
                                FoodDetail(food: food)
                            } label: {
                                Text(food.name)
                                    .foregroundColor(food.isGood ? .green : .red)
                            }
                        }
                        .onDelete(perform: deleteFood)
                    }
                } else {
                    ContentUnavailableView {
                        Label("No Food", systemImage: "fork.knife")
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Food")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addFood) {
                        Label("Add Food", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $newFood) { food in
                NavigationStack {
                    FoodDetail(food: food, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a food")
                .navigationTitle("Food")
        }
    }
    
    private func addFood() {
        let newItem = Food(name: "", isGood: false)
        modelContext.insert(newItem)
        DispatchQueue.main.async {
            self.newFood = newItem
        }
    }
    
    private func deleteFood(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(foods[index])
            }
        }
    }
}

#Preview {
    FoodList()
        .modelContainer(SampleData.shared.modelContainer)
}
