//
//  NastiaFoodApp.swift
//  NastiaFood
//
//  Created by Armando Cáceres on 26/8/24.
//

import SwiftUI
import SwiftData

@main
struct NastiaFoodApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Food.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
