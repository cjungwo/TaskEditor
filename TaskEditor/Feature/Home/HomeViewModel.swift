//
//  HomeViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
  @Published var user: User?
  @Published var tasks: [Task]
  @Published var showCreateTaskView: Bool = false

  var container: DIContainer

  init(container: DIContainer) {
    self.container = container
//    self.tasks = container.services.taskService.getTasks()
    self.tasks = Mocks.mockTaskList
  }
}
