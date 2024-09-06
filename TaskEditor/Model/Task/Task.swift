//
//  Todo.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import Foundation

class Task: Script {
  var taskType: String // TODO: - enum
  var dueDate: Date
  var priorityLevel: Int // TODO: - enum
  var isDone: Bool

  init(
    title: String,
    content: String? = nil,
    createdDate: Date,
    modifiedDate: Date,
    taskType: String,
    dueDate: Date,
    priorityLevel: Int,
    isDone: Bool
  ) {
    self.taskType = taskType
    self.dueDate = dueDate
    self.priorityLevel = priorityLevel
    self.isDone = isDone
    super.init(title: title, content: content, createdDate: createdDate, modifiedDate: modifiedDate)
  }
}
