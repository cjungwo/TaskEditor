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

  var taskService = TaskService(task: nil)

  // TODO: - tappedCreateTaskBtn
  func tappedCreateTaskBtn() {
    print("DEBUG: CreateTaskBtn Tapped")
    showCreateTaskView = true
  }

  // TODO: - tappedEditTaskBtn
  func tappedEditTaskBtn() {
    print("DEBUG: EditTaskBtn Tapped")
  }

  func deleteTaskById(_ id: String) {
    let db = Firestore.firestore()

    db.collection("tasks")
      .document(id)
      .delete()
  }

  func toggleIsDone(task: Task) {
    var taskCopy = task
    taskCopy.setDone(!task.isDone)

    let db = Firestore.firestore()

    db.collection("tasks")
      .document(taskCopy.id)
      .setData(taskCopy.asDictionary())
  }
}
