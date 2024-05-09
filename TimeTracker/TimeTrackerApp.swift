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
            TagModel.self,
            WorkDay.self,
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
                .task { @MainActor in
                    if !isMockTasksSaved {
                        sampleTasks.forEach { sharedModelContainer.mainContext.insert($0) }
                        isMockTasksSaved = true
                    }
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
