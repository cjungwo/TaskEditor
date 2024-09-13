//
//  HomeViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
  var taskService: TaskService = TaskService(task: nil)

  func getTodayTasks() {
    _ = taskService.getTasks().filter {
      $0.dueDate < .now
    }
  }

  // TODO: - tappedCreateTaskBtn
  func tappedCreateTaskBtn() {
    print("DEBUG: CreateTaskBtn Tapped")
    // TODO: - link CreateTaskView or CreateTaskSheet
  }
}
