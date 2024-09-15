//
//  TaskRepository.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 14/9/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol TaskRepositoryType {
  var tasks: [TaskDTO] { get set }

  func addTask(_ taskDTO: TaskDTO)
  func getTasks() -> [TaskDTO]
  func deleteTaskById(_ id: String)
}

class TaskRepository: TaskRepositoryType {
  var tasks: [TaskDTO] = []

  func addTask(_ dto: TaskDTO) {
    guard let uId = Auth.auth().currentUser?.uid else {
      print("ERROR: error - Not sign in")
      return
    }

    let db = Firestore.firestore()

    db.collection("users")
      .document(uId)
      .collection("tasks")
      .document(dto.id)
      .setData(dto.asDictionary())
  }

  func getTasks() -> [TaskDTO] {
    guard let uId = Auth.auth().currentUser?.uid else {
      print("ERROR: error - Not sign in")
      return []
    }

    let db = Firestore.firestore()

    db.collection("users")
      .document(uId)
      .collection("tasks")
      .getDocuments {
        snapshot,
        error in
        guard let documents = snapshot?.documents,
              error == nil else {
          return
        }
        for document in documents {
          self.tasks.append(
            .init(
              id:  document["id"] as? String ?? "",
              title:  document["title"] as? String ?? "",
              type:  document["type"] as? String ?? "",
              content:  document["content"] as? String ?? "",
              dueDate: document["dueDate"] as? TimeInterval ?? 0,
              estimateTime:  document["estimateTime"] as? Int ?? 1,
              importanceLevel:  document["importanceLevel"] as? Int ?? 1,
              urgencyLevel:  document["urgencyLevel"] as? Int ?? 1,
              isDone: document["isDone"] as? Bool ?? false,
              createdDate: document["createDate"] as? TimeInterval ?? 0,
              modifiedDate: document["modifiedDate"] as? TimeInterval ?? 0
            )
          )
        }
      }

    return tasks
  }

  func deleteTaskById(_ id: String) {
    // Get current user id
    guard let uId = Auth.auth().currentUser?.uid else {
      return
    }

    let db = Firestore.firestore()

    db.collection("users")
      .document(uId)
      .collection("tasks")
      .document(id)
      .delete()
  }
}
