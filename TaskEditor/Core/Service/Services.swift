//
//  Services.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 13/9/2024.
//

import Foundation

protocol ServiceType {
  var taskService: TaskService { get set }
}

class Services: ServiceType {
  var taskService: TaskService

  init() {
    taskService = TaskService()
  }
}

class StubServices: ServiceType {
  var taskService: TaskService = TaskService()
}
