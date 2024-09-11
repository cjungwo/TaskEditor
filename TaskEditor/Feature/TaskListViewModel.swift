//
//  TodoListViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import Foundation
import FirebaseFirestore

class TaskListViewModel: ObservableObject {
  @Published var showCreateTaskView: Bool = false
  @Published var showEditTaskView: Bool = false
  @Published var searchText: String = ""

  func deleteTaskById(_ id: String) {
    let db = Firestore.firestore()

    db.collection("tasks")
      .document(id)
      .delete()
  }
}
