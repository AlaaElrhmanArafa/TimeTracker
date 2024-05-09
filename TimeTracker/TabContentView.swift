//
//  ContentView.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 17/03/2024.
//

import SwiftUI

enum TabContentView : Int, CaseIterable, Identifiable {
    var id: Int{ return self.rawValue }
    
    case myTasks = 0
    case myProdactivity = 1
    
    var tabImage: Image {
        switch self {
        case .myTasks:
            Image(systemName: "clock")
        case .myProdactivity:
            Image(systemName: "chart.pie")
        }
    }
}

struct ContentView: View {
    
    @State var selectedTab: TabContentView = .myTasks
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(TabContentView.allCases){ contentView in
                NavigationStack{
                    setupView(tabContentView: contentView)
                }
                .tabItem {
                    contentView.tabImage
                        .resizable()
                        .frame(width: 120, height: 120)
                        .environment(\.symbolVariants, .none)
                }
                .tag(contentView.id)
            }
        }
        .tint(.black)
    }
    
    @ViewBuilder
    func setupView(tabContentView: TabContentView) -> some View {
        switch tabContentView {
        case .myTasks:
            TasksView()
        case .myProdactivity:
            MyProdactivityView()
        }
    }
}

#Preview {
    ContentView()
}
