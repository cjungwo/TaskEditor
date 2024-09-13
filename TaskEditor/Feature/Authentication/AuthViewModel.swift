//
//  AuthViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 14/9/2024.
//

import Foundation

enum AuthState {
  case unauthenticated
  case authenticated
}

class AuthViewModel: ObservableObject {
  @Published var authState: AuthState = .authenticated

  private var container: DIContainer

  init(container: DIContainer) {
    self.container = container
  }
}
