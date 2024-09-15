//
//  AuthViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 14/9/2024.
//

import Foundation
import FirebaseAuth

enum AuthState {
  case unauthenticated
  case authenticated
}

class AuthViewModel: ObservableObject {
  @Published var authState: AuthState = .unauthenticated
  @Published var currentUserId: String = ""

  private var container: DIContainer
  private var handler: AuthStateDidChangeListenerHandle?

  init(container: DIContainer) {
    self.container = container
    self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
      DispatchQueue.main.async {
        self?.currentUserId = user?.uid ?? ""
      }
    }
  }

  func signIn() {
    container.services.authService.signIn(email: Mocks.mockUser.email, password: Mocks.mockUser.password)
    authState = .authenticated
  }


  func createUser() {
    let newUser: User = .init(
      email: "test@gmail.com",
      password: "test1234",
      name: "Tester",
      birthDate: .init(timeIntervalSince1970: 20000000),
      job: "Developer",
      position: "iOS",
      priorityList: [.directPerformance, .humanNetwork, .indirectPerformance, .personalWork, .selfDevelopment]
    )

    container.services.authService.signUp(user: newUser)
  }
}
