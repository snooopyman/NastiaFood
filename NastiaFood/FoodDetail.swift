//
//  FoodDetail.swift
//  NastiaFood
//
//  Created by Armando Cáceres on 26/8/24.
//

import SwiftUI
import SwiftData

struct FoodDetail: View {
    @Bindable var food: Food
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    init(food: Food, isNew: Bool = false) {
        self.food = food
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Food Name", text: $food.name)
                .autocorrectionDisabled()
            Toggle("Is Good?", isOn: $food.isGood)
        }
        .navigationTitle(isNew ? "New Food" : "Food")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(food)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview("New Food") {
    NavigationStack {
        FoodDetail(food: SampleData.shared.food, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
