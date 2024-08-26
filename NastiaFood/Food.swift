//
//  Food.swift
//  NastiaFood
//
//  Created by Armando Cáceres on 26/8/24.
//

import Foundation
import SwiftData

@Model
final class Food {
    var name: String
    var isGood: Bool
    
    init(name: String, isGood: Bool) {
        self.name = name
        self.isGood = isGood
    }
    
    static let sampleData = [
        Food(name: "Pizza", isGood: false),
        Food(name: "Broccoli", isGood: true),
        Food(name: "Ice Cream", isGood: false),
        Food(name: "Spinach", isGood: true),
        Food(name: "Burger", isGood: false)
    ]
}
