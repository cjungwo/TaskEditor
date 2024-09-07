//
//  Mocks.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 6/9/2024.
//

import Foundation

struct Mocks {
  static var mockUser:  User = User(name: "Chris", birthDate: .now, gender: true, job: "Developer", position: "Frontend", typePriorityList: ["Work", "Faith"])

  static var mockTaskList: [Task] = [
    Task(title: "To study", content: "This is content", createdDate: .now, modifiedDate: .now, taskType: "Study", dueDate: .now, priorityLevel: 3),
    Task(title: "To work", createdDate: .now, modifiedDate: .now, taskType: "Work", dueDate: .now, priorityLevel: 4, isDone: true),
    Task(title: "To work", createdDate: .now, modifiedDate: .now, taskType: "Work", dueDate: .now, priorityLevel: 2),
    Task(title: "To study", createdDate: .now, modifiedDate: .now, taskType: "Study", dueDate: .now, priorityLevel: 1),
    Task(title: "To pray", content: "This is content", createdDate: .now, modifiedDate: .now, taskType: "Faith", dueDate: .now, priorityLevel: 3),
    Task(title: "To study", createdDate: .now, modifiedDate: .now, taskType: "Study", dueDate: .now, priorityLevel: 3),
    Task(title: "To work", createdDate: .now, modifiedDate: .now, taskType: "Work", dueDate: .now, priorityLevel: 4, isDone: true),
    Task(title: "To work", content: "This is content", createdDate: .now, modifiedDate: .now, taskType: "Work", dueDate: .now, priorityLevel: 2),
    Task(title: "To study", createdDate: .now, modifiedDate: .now, taskType: "Study", dueDate: .now, priorityLevel: 1),
    Task(title: "To pray", createdDate: .now, modifiedDate: .now, taskType: "Faith", dueDate: .now, priorityLevel: 3),
    Task(title: "To study", createdDate: .now, modifiedDate: .now, taskType: "Study", dueDate: .now, priorityLevel: 3),
    Task(title: "To work", createdDate: .now, modifiedDate: .now, taskType: "Work", dueDate: .now, priorityLevel: 4, isDone: true),
    Task(title: "To work", content: "This is content", createdDate: .now, modifiedDate: .now, taskType: "Work", dueDate: .now, priorityLevel: 2),
    Task(title: "To study", createdDate: .now, modifiedDate: .now, taskType: "Study", dueDate: .now, priorityLevel: 1),
    Task(title: "To pray", createdDate: .now, modifiedDate: .now, taskType: "Faith", dueDate: .now, priorityLevel: 3)
  ]

  static var mockIdeaList: [Idea] = [
    Idea(title: "App Dev Idea", createdDate: .now, modifiedDate: .now, isImportant: true, ideaType: "App"),
    Idea(title: "Web Dev Idea", content: "This is content", createdDate: .now, modifiedDate: .now, isImportant: false, ideaType: "Web"),
    Idea(title: "App Design Idea", createdDate: .now, modifiedDate: .now, isImportant: false, ideaType: "App"),
    Idea(title: "Web Design Idea", content: "This is content", createdDate: .now, modifiedDate: .now, isImportant: true, ideaType: "Web"),
    Idea(title: "App Launching Idea", content: "This is content", createdDate: .now, modifiedDate: .now, isImportant: false, ideaType: "App"),
    Idea(title: "Web Launching Idea", createdDate: .now, modifiedDate: .now, isImportant: false, ideaType: "Web")
  ]

}
