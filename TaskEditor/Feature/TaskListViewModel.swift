//
//  TodoListViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import Foundation
import FirebaseFirestore

class TaskListViewModel: ObservableObject {
  @Published var user: User = Mocks.mockUser
  @Published var tasks: [Task]
  @Published var showCreateTaskView: Bool = false
  @Published var searchText: String = ""

  private var container: DIContainer

  init(container: DIContainer) {
    self.container = container
    self.tasks = container.services.taskService.getTasks()
  }

  var filteredTasks: [Task] {
   if searchText.isEmpty {
     return orderPriorityOfTasks(getTodayTasks())
   } else {
     return orderPriorityOfTasks(getTodayTasks()).filter { $0.title.localizedCaseInsensitiveContains(searchText) }
   }
 }

  func updateTasks() {
    tasks = container.services.taskService.getTasks()
  }

  // TODO: - tappedCreateTaskBtn
  func tappedCreateTaskBtn() {
    print("DEBUG: CreateTaskBtn Tapped")
    showCreateTaskView = true
  }

  func toggleIsDone(task: Task) {
    if let index = tasks.firstIndex(where: { $0 == task }) {
      tasks[index].isDone.toggle()
      container.services.taskService.toggleIsDone(task: tasks[index])
      print("DEBUG: isDone changed \(tasks[index].isDone)")
    }
  }

  func orderPriorityOfTodayTasks() -> [Task] {
    orderPriorityOfTasks(getTodayTasks())
  }

  func orderPriorityOfTasks(_ tasks: [Task]) -> [Task]{
    guard !tasks.isEmpty else {
      return tasks
    }

    let orderedTasks = tasks.sorted { setPriorityLevel(to: $0) > setPriorityLevel(to: $1) }

    return orderedTasks
  }

  private func setPriorityLevel(to task: Task) -> Int {
    var level: Int = 0

    switch (task.importanceLevel, task.urgencyLevel) {
    case (5, 5), (4, 5), (5, 4):
      level = 5
    case (5, 1), (5, 2), (5, 3), (4, 4), (1, 5), (2, 5), (3, 5):
      level = 4
    case (4, 1), (4, 2), (4, 3), (3, 3), (1, 4), (2, 4), (3, 4):
      level = 3
    case (3, 1), (3, 2), (2, 2), (1, 3), (2, 3):
      level = 2
    case (1, 1), (1, 2), (2, 1):
      level = 1
    default:
      level = 1
    }

    for type in user.priorityList {
      var count = 5
      if type == task.type {
        level += count
        break
      }
      count -= 1
    }

    if "\(task.dueDate.formatted(date: .abbreviated, time: .omitted))" == "\(Date().formatted(date: .abbreviated, time: .omitted))" {
      level += 1
    }

    if task.dueDate < .now {
      level += 10
    }
    return level
  }


  // TODO: - tappedCreateTaskBtn
  func tappedGoToTaskListBtn() {
    print("DEBUG: GoToTaskListBtn Tapped")
    // TODO: - link CreateTaskView or CreateTaskSheet
  }

  func getTodayTasks() -> [Task] {
    var todayTasks: [Task] = []
    var notTodayTasks: [Task] = []

    todayTasks = tasks.filter {
      $0.dueDate.formatted(date: .abbreviated, time: .omitted) == Date().formatted(date: .abbreviated, time: .omitted)
    }

   notTodayTasks = tasks.filter {
      $0.dueDate.formatted(date: .abbreviated, time: .omitted) != Date().formatted(date: .abbreviated, time: .omitted)
    }

    guard !notTodayTasks.isEmpty else {
      return todayTasks
    }

    for task in notTodayTasks {
      if task.dueDate.addingTimeInterval(TimeInterval(task.estimateTime*3600)) <= Date().addingTimeInterval(86400) {
        todayTasks.append(task)
      }
    }

    return todayTasks
  }
}
