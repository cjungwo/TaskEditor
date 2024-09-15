//
//  AuthService.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 14/9/2024.
//

import Foundation

protocol AuthServiceType {
  func fetchUser() -> User?
  func signIn(email: String, password: String)
  func signUp(user: User)
}

class AuthService: AuthServiceType {

  private var authRepo: AuthRepositoryType

  init(authRepo: AuthRepositoryType) {
    self.authRepo = authRepo
  }

  func fetchUser() -> User? {
    authRepo.fetchUser()?.toData()
  }
  
  func signIn(email: String, password: String) {
    authRepo.signIn(email: email, password: email)
  }
  
  func signUp(user: User) {
    authRepo.signUp(userDTO: user.toDTO())
  }
}


class StubAuthService: AuthServiceType {
  func signIn(email: String, password: String) {}
  func fetchUser() -> User? {
    return nil
  }
  func signUp(user: User) {}
}
