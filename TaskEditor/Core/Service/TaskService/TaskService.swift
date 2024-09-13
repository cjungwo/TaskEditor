//
//  TaskService.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 13/9/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TaskService {
  @FirestoreQuery var tasks: [Task]

  init() {
    self._tasks = FirestoreQuery(collectionPath: "/tasks")
  }

  private func validCheck(_ task: Task) -> Bool {
    guard !task.title.trimmingCharacters(in: .whitespaces).isEmpty else {
      return false
    }

    guard task.dueDate >= Date().addingTimeInterval(-86400) else {
      return false
    }

    return true
  }
}

// MARK: - Get
extension TaskService {
  func getTasks() -> [Task] {
    return tasks
  }
}

// MARK: - Post
extension TaskService {
  func createTask(task: Task) {
    guard validCheck(task) else {
      return
    }

    // Create model
    let newTask = Task(
      title: task.title, 
      type: .directPerformance,
      content: task.content,
      dueDate: task.dueDate,
      estimateTime: task.estimateTime,
      importanceLevel: task.importanceLevel,
      urgencyLevel: task.urgencyLevel
    )

    // Save Model
    let db = Firestore.firestore()

    db.collection("tasks")
      .document(newTask.id)
      .setData(newTask.asDictionary())
  }
}

// MARK: - Update
extension TaskService {
  func updateTask(task: Task) {
    guard validCheck(task) else {
      return
    }

    // Save Model
    let db = Firestore.firestore()

    db.collection("task")
      .document(task.id)
      .setData([
        "id": task.id,
        "title": task.title,
        "type": task.type,
        "content": task.content!,
        "dueDate": task.dueDate.timeIntervalSince1970,
        "estimateTime": task.estimateTime,
        "importanceLevel": task.importanceLevel,
        "urgencyLevel":  task.urgencyLevel,
        "isDone": task.isDone,
        "createdDate": task.createdDate,
        "modifiedDate": task.modifiedDate
      ])
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

// MARK: - Delete
extension TaskService {
  func deleteTaskById(_ id: String) {
    let db = Firestore.firestore()

    db.collection("tasks")
      .document(id)
      .delete()
  }
}
