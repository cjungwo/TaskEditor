//
//  Services.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 13/9/2024.
//

import Foundation

protocol ServiceType {
  var taskService: TaskServiceType { get set }
  var authService: AuthServiceType { get set }
}

class Services: ServiceType {
  var taskService: TaskServiceType
  var authService: AuthServiceType

  init() {
    taskService = TaskService(taskRepo: TaskRepository())
    authService = AuthService(authRepo: AuthRepository())
  }
}

class StubServices: ServiceType {
  var taskService: TaskServiceType = StubTaskService()
  var authService: AuthServiceType = StubAuthService()
}
