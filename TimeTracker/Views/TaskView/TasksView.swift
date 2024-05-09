//
//  TasksView.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 17/03/2024.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    @Query private var tasks: [TaskModel]
    @State var createNewTask: Bool = false
    @State var sheetSize: CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                CurrentTaskView()
                
                ScrollView(.vertical) {
                    ForEach(tasks){ task in
                        TaskRowView(task: task, isTaskCurrenlyPlayed: Bool.random())
                            .frame(height: 84)
                    }
                }
                .scrollIndicators(.hidden)
                .padding([.top, .vertical], 15)
            }
            .padding()
            .navigationTitle("Tasks")
            .background(Color.mainBackground)
            .sheet(isPresented: $createNewTask, content: {
                AddTaskView()
                    .presentationDetents([.height(sheetSize.height)])
                    .presentationCornerRadius(30)
                    .presentationBackground(.white)
            })
            .overlay {
                
            }
            
            Button(action: {
                createNewTask.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(.black.shadow(.drop(color: .black.opacity(0.25),radius: 5)), in: .circle)
            })
            .padding()
        }
    }
}

#Preview {
    TasksView()
}


