//
//  ContainerPreview.swift
//  TimeTracker
//
//  Created by AlaaElrhman Arafa on 09/05/2024.
//

import Foundation
import SwiftData
import SwiftUI

struct ContainerPreview<Content: View>: View {
    
    @ViewBuilder let content: Content
    var mockContainer: ModelContainer = {
        let schema = Schema([
            WorkDay.self,
            TagModel.self,
            TaskModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some View {
        content
            .modelContainer(mockContainer)
    }
}
