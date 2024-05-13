//
//  Task.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 20/03/2024.
//

import SwiftUI
import SwiftData

@Model
class WorkDay {
    @Attribute(.unique) var id: Int
    var date: String
    var loggedHours: Int
    @Relationship(deleteRule: .nullify, inverse: \TaskModel.workDays) var tasks: [TaskModel] = [TaskModel]()
    
    init(id: Int, date: String, loggedHours: Int, tasks: [TaskModel] = []) {
        self.id = id
        self.date = date
        self.loggedHours = loggedHours
        self.tasks = tasks
    }
}

@Model
class TagModel {
    @Attribute(.unique) var id: UUID
    var tagTitle: String
    var tint: String
    @Relationship(deleteRule: .nullify, inverse: \TaskModel.tagsItems) var tasks: [TaskModel] = [TaskModel]()
    
    init(tagTitle: String, tint: String) {
        self.id = UUID()
        self.tagTitle = tagTitle
        self.tint = tint
        self.tasks = []
    }
}

@Model
class TaskModel {
    @Attribute(.unique) var id: UUID
    var taskTitle: String
    var creationDate: Date = Date()
    var isWorking: Bool = false
    var isCompleted: Bool = false
    var tint: String
    @Relationship(deleteRule: .nullify) var tagsItems: [TagModel] = [TagModel]()
    var image: String
    @Relationship(deleteRule: .nullify) var workDays: [WorkDay] = [WorkDay]()
   
    init(
        taskTitle: String,
        creationDate: Date,
        isWorking: Bool,
        isCompleted: Bool = false,
        tint: String,
        tags: [TagModel],
        image: String
    ) {
        self.id = UUID()
        self.taskTitle = taskTitle
        self.creationDate = creationDate
        self.isWorking = isWorking
        self.tint = tint
        self.tagsItems = tags
        self.image = image
    }
}
 var sampleTasks: [TaskModel] = [
    .init(
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
    ),
    .init(
        taskTitle: "Redesign Website",
        creationDate: .updateHour (-3),
        isWorking: false,
        tint: "#FFA656",
        tags: [
            TagModel(
                tagTitle: "Personal",
                tint: "#789012"
            ),
            TagModel(
                tagTitle: "Reading",
                tint: "#789012"
            )
        ],
        image: "plus"
    ),
    .init(
        taskTitle: "Go for a Walk",
        creationDate: .updateHour(-4),
        isWorking: false,
        tint: "#FD5B71",
        tags: [
            TagModel(
                tagTitle: "workout",
                tint: "#6a5acd"
            ),
            TagModel(
                tagTitle: "Personal",
                tint: "#ee82ee"
            )
        ],
        image: "clock.fill"
    ),
    .init(
        taskTitle: "Edit Video",
        creationDate: .updateHour(0),
        isWorking: true,
        tint: "#07E092",
        tags: [
            TagModel(
                tagTitle: "Work",
                tint: "#0000ff"
            ),
            TagModel(
                tagTitle: "Coding",
                tint: "#ffa500"
            )
        ],
        image: "plus.circle"
    ),
    .init(
        taskTitle: "Publish Video",
        creationDate: .updateHour(2),
        isWorking: true,
        tint: "#565786",
        tags: [
            TagModel(
                tagTitle: "Work",
                tint: "#0000ff"
            ),
            TagModel(
                tagTitle: "workout",
                tint: "#6a5acd"
            )
        ],
        image: "car"
    ),
]


extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calender = Calendar.current
        return calender.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
