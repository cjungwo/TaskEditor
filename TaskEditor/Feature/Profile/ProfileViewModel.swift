//
//  ProfileViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
  @Published var user: User? = nil

  private var container: DIContainer

  init(container: DIContainer) {
    self.container = container
  }

  func fetchUser() {
    user = container.services.authService.fetchUser()
  }
}
