//
//  TaskRowView.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 20/03/2024.
//

import SwiftUI
import SwiftData

struct TaskRowView: View {
    @Bindable var task: TaskModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            taskImageView()
            
            VStack(alignment: .leading) {
                Text(task.taskTitle)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.black)
                tagsList()
            }
            Spacer()
            playerView()
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color.white, in: .rect(cornerRadius: 5))
    }
    
    @ViewBuilder
    private func taskImageView() -> some View {
        ZStack {
            Circle()
                .fill(Color(hex: task.tint))
                .frame(width: 44, height: 44)
                .background(.white.shadow(.drop(color: .black.opacity(0.1),radius: 3)), in: .circle)
            
            Image(systemName: task.image)
                .renderingMode(.template)
                .foregroundStyle(.white)
        }
    }
    
    @ViewBuilder
    private func tagsList() -> some View {
        HStack {
            ForEach(task.tagsItems, id: \TagModel.id) { tagItem in
                Text(tagItem.tagTitle)
                    .padding([.leading, .trailing], 8)
                    .background(Color(hex:tagItem.tint).opacity(0.2))
                    .foregroundStyle(Color(hex:tagItem.tint))
                    .clipShape(Capsule())
                    .frame(height: 20)
            }
        }
    }
    
    @ViewBuilder
    private func playerView() -> some View {
        VStack(alignment: .trailing) {
            Text(task.creationDate.format("HH:mm:ss"))
                .font(.system(size: 12, weight: .regular))
            
            Button(action: {
                task.isWorking.toggle()
            }, label: {
                withAnimation(.easeInOut) {
                    Image(systemName: task.isWorking ? "play.fill" : "pause.fill")
                        .frame(width: 17, height: 17)
                }
            })
            .offset(y: 4)
        }
    }
}

#Preview {
    ContainerPreview(models: TaskModel.self) { context in
         let task = sampleTasks[0]
         context.insert(task)
         return TaskRowView(task: task)
    }
}
