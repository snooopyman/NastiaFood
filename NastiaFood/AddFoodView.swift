//
//  AddFoodView.swift
//  NastiaFood
//
//  Created by Armando Cáceres on 27/8/24.
//

import SwiftUI
import SwiftData

struct AddFoodView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name = ""
    @State private var isGood = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Food Name", text: $name)
                Toggle("Is Good", isOn: $isGood)
            }
            .navigationTitle("Add Food")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        addFood()
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
    
    private func addFood() {
        let newFood = Food(name: name, isGood: isGood)
        modelContext.insert(newFood)
    }
}

#Preview {
    AddFoodView()
        .modelContainer(for: Food.self, inMemory: true)
}
