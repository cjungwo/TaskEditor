//
//  Mocks.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 6/9/2024.
//

import Foundation

struct Mocks {
  static var mockUser = User(email: "test@gmail.com", password: "test1234", name: "Tester", birthDate: .now, job: "Developer", position: "Frontend", priorityList: ["Study", "Work", "Play"])

  static var mockTaskList = [
    Task(title: "Task1", type: TaskType.directPerformance.rawValue,content: "This is content. This is content. This is content. This is content.", dueDate: .now, estimateTime: 2, importanceLevel: 1, urgencyLevel: 1, isDone: true),
    Task(title: "Task2", type: TaskType.selfDevelopment.rawValue, content: "This is content...", dueDate: .now, estimateTime: 16, importanceLevel: 2, urgencyLevel: 4),
    Task(title: "Task3", type: TaskType.indirectPerformance.rawValue, dueDate: .now, estimateTime: 9, importanceLevel: 1, urgencyLevel: 1),
    Task(title: "Task4", type: TaskType.directPerformance.rawValue, dueDate: .now, estimateTime: 6, importanceLevel: 3, urgencyLevel: 5),
    Task(title: "Task5", type: TaskType.personalWork.rawValue, content: "This is content...", dueDate: .now, estimateTime: 2, importanceLevel: 2, urgencyLevel: 1),
    Task(title: "Task6", type: TaskType.humanNetwork.rawValue, dueDate: .now, estimateTime: 1, importanceLevel: 3, urgencyLevel: 2),
    Task(title: "Task7", type: TaskType.directPerformance.rawValue, dueDate: .now, estimateTime: 8, importanceLevel: 4, urgencyLevel: 1),
    Task(title: "Task8", type: TaskType.personalWork.rawValue,content: "This is content...",  dueDate: .now, estimateTime: 2, importanceLevel: 5, urgencyLevel: 4),
    Task(title: "Task9", type: TaskType.selfDevelopment.rawValue, dueDate: .now, estimateTime: 48, importanceLevel: 1, urgencyLevel: 2)
  ]
}
