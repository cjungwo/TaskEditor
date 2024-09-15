//
//  TaskViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 11/9/2024.
//

import Foundation
import FirebaseFirestore

class TaskViewModel: ObservableObject {
  @Published var title: String
  @Published var type: TaskType
  @Published var dueDate: Date
  @Published var content: String
  @Published var estimateTime: Int
  @Published var importanceLevel: Int
  @Published var urgencyLevel: Int
  @Published var isDone: Bool

  var task: Task
  private var container: DIContainer

  init(task: Task, container: DIContainer) {
    self.container = container
    self.task = task

    self.title = task.title
    self.type = task.type
    self.content = task.content ?? ""
    self.dueDate = task.dueDate
    self.estimateTime = task.estimateTime
    self.importanceLevel = task.importanceLevel
    self.urgencyLevel = task.urgencyLevel
    self.isDone = task.isDone
  }
}

extension TaskViewModel {
  func createTask() {
    let task: Task = .init(
      title: title,
      type: type,
      content: content,
      dueDate: dueDate,
      estimateTime: estimateTime,
      importanceLevel: importanceLevel,
      urgencyLevel: urgencyLevel,
      isDone: isDone
    )

    container.services.taskService.createTask(
      task: task
    )
    print("DEBUG: createTask \(task.self)")
  }

  func toggleIsDone() {
    isDone.toggle()
    container.services.taskService.toggleIsDone(task: task)
    print("DEBUG: isDone changed \(isDone)")
  }
}
