//
//  TaskRowView.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 20/03/2024.
//

import SwiftUI

struct TaskRowView: View {
    let task: TaskModel
    @State var isTaskCurrenlyPlayed: Bool
    
    var body: some View {
        HStack(alignment: .center) {
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
                isTaskCurrenlyPlayed.toggle()
            }, label: {
                withAnimation(.easeInOut) {
                    Image(systemName: isTaskCurrenlyPlayed ? "play.fill" : "pause.fill")
                        .frame(width: 17, height: 17)
                }
            })
            .offset(y: 4)
        }
    }
}

#Preview {
    TaskRowView(task: TaskModel.init(
        taskTitle: "Record Video",
        creationDate: .updateHour(-5),
        isWorking: true,
        tint: "#9B51E0",
        tags: [
            TagModel(
                tagTitle: "Work",
                tint: "#0000ff"
            ),
            TagModel(
                tagTitle: "Personal",
                tint: "#ee82ee"
            )
        ],
        image: "clock"
    ), isTaskCurrenlyPlayed: true)
}

#Preview {
    TasksView()
}
