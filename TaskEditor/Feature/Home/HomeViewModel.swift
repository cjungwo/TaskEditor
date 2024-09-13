//
//  HomeViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
  @Published var user: User?
  @Published var tasks: [Task] = Mocks.mockTaskList

  // TODO: - tappedCreateTaskBtn
  func tappedCreateTaskBtn() {
    print("DEBUG: CreateTaskBtn Tapped")
    // TODO: - link CreateTaskView or CreateTaskSheet
  }

  // TODO: - tappedCreateTaskBtn
  func tappedGoToTaskListBtn() {
    print("DEBUG: GoToTaskListBtn Tapped")
    // TODO: - link CreateTaskView or CreateTaskSheet
  }
}
