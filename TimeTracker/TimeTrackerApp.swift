//
//  TimeTrackerApp.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 17/03/2024.
//

import SwiftUI
import SwiftData

@main
struct TimeTrackerApp: App {
    @AppStorage("isMockTasksSaved") var isMockTasksSaved: Bool = false

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            WorkDay.self,
            TagModel.self,
            TaskModel.self,
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
