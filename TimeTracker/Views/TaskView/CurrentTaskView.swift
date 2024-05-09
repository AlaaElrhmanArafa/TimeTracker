//
//  CurrentTaskView.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 19/03/2024.
//

import SwiftUI

struct CurrentTaskView: View {
    @State var isDetailsPresented: Bool = false
    
    var body: some View {
        TimelineView(.everyMinute) { time in
            VStack {
                HStack(alignment: .center) {
                    Text(time.date.format("HH:mm:ss"))
                        .font(.system(size: 32, weight: .medium))

                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: 16, height: 16)
                }
            
                HStack {
                    Image(.ratioIcon)
                        .frame(width: 12, height: 12)
                    
                    Text("Rasion Project")
    
                    Spacer()
                }
                .font(.system(size: 16, weight: .regular))
            }
            .padding([.top, .bottom], 26)
            .padding([.leading, .trailing], 16)
        }
        .frame(height: 114)
        .background(.runningTask)
        .foregroundColor(.white)
        .cornerRadius(20)
        .sheet(isPresented: $isDetailsPresented, onDismiss: {
            isDetailsPresented = false
        }, content: {
            TaskDetailsView()
        })
        .onTapGesture {
            isDetailsPresented = true
        }
    }
}

#Preview {
    CurrentTaskView(isDetailsPresented: false)
}

#Preview {
    ContentView()
}
