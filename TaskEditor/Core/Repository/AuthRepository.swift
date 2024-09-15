//
//  AuthRepository.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 15/9/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol AuthRepositoryType {
  func fetchUser() -> UserDTO?
  func signIn(email: String, password: String)
  func signUp(userDTO: UserDTO)
}

class AuthRepository: AuthRepositoryType {
  var userDTO: UserDTO? = nil

  func fetchUser() -> UserDTO? {
    guard let userId = Auth.auth().currentUser?.uid else {
      return nil
    }

    let db = Firestore.firestore()

    db.collection("users")
      .document(userId)
      .getDocument {
        [weak self] snapshot,
        error in
        guard let data = snapshot?.data(),
              error == nil else {
          return
        }

        DispatchQueue.main.async {
          self?.userDTO = UserDTO(
            id: data["id"] as? String ?? "",
            email: data["email"] as? String ?? "",
            password: data["password"] as? String ?? "",
            name: data["name"] as? String ?? "",
            birthDate: data["birthDate"] as? TimeInterval ?? 0,
            job: data["job"] as? String ?? "",
            position: data["position"] as? String ?? "",
            priorityList: data["priorityList"] as? String ?? ""
          )
        }
      }

    return userDTO
  }

  func signIn(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password)
    print(Auth.auth().currentUser ?? "Error: error")
  }

  func signUp(userDTO: UserDTO) {
    Auth.auth().createUser(withEmail: userDTO.email, password: userDTO.password) { [weak self] result, error in
      guard let uid = result?.user.uid else {
        print("DEBUG: This account is already existed")
        return
      }

      print(uid)


      self?.makeUser(userDTO: userDTO)
    }
  }

  private func makeUser(userDTO: UserDTO) {

    let db = Firestore.firestore()

    db.collection("users")
      .document(userDTO.id)
      .setData(userDTO.asDictionary())
  }
}
