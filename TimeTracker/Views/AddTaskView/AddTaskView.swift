//
//  AddTaskView.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 17/03/2024.
//

import SwiftUI

struct AddTaskView: View {
    /// View Proprties
    @Environment(\.dismiss) private var dismiss
    @State private var taskTitle: String = ""
    @State private var creationDate: Date = .init()
    @State private var taskImage: UIImage = .ratioIcon
    @State private var tags: [TagModel] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
//            Button()
        }
    }
}

#Preview {
    AddTaskView()
}
