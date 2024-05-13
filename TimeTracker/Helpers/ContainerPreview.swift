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
        
    private var mockContainer: ModelContainer
    private let content: (_ context: ModelContext) -> Content
    
    init(models: any PersistentModel.Type..., content: @escaping (_ context: ModelContext) -> Content ) {
        self.content = content
        let schema = Schema(models)
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
             mockContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    private func saveItems(items: [any PersistentModel]) {
        Task { @MainActor in
            items.forEach { item in
                mockContainer.mainContext.insert(item)
            }
        }
    }
    
    var body: some View {
        content(mockContainer.mainContext)
            .modelContainer(mockContainer)
    }
}
