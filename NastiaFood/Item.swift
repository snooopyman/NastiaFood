//
//  Item.swift
//  NastiaFood
//
//  Created by Armando Cáceres on 26/8/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
