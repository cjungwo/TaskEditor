//
//  TaskService.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 13/9/2024.
//
import Foundation

protocol TaskServiceType {
  func getTasks() -> [Task]
  func createTask(task: Task)
  func toggleIsDone(task: Task)
  func deleteTaskById(id: String)
}

class TaskService: TaskServiceType {
  
  private var taskRepo: TaskRepositoryType

  init(taskRepo: TaskRepositoryType) {
    self.taskRepo = taskRepo
  }

  private func validCheck(_ task: Task) -> Bool {
    guard !task.title.trimmingCharacters(in: .whitespaces).isEmpty else {
      return false
    }

    guard task.dueDate >= Date().addingTimeInterval(-86400) else {
      return false
    }

    return true
  }

  func getTasks() -> [Task] {
    return taskRepo.getTasks().map { $0.toData() }
  }

  func createTask(task: Task) {
    guard validCheck(task) else {
      return
    }

    taskRepo.addTask(task.toDTO())

    print("DEBUG: taskRepo \(task.toDTO().self)")
  }

  func toggleIsDone(task: Task) {
    var taskCopy = task
    taskCopy.setDone(!task.isDone)

    taskRepo.addTask(taskCopy.toDTO())
  }

  func deleteTaskById(id: String) {
    taskRepo.deleteTaskById(id)
  }

}

class StubTaskService: TaskServiceType {
  func toggleIsDone(task: Task) {

  }
  
  func deleteTaskById(id: String) {

  }
  
  func getTasks() -> [Task] {
    Mocks.mockTaskList
  }
  
  func createTask(task: Task) {

  }
}
