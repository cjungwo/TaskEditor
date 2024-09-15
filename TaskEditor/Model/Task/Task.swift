//
//  Todo.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import Foundation

struct Task: Identifiable, Equatable {
  var id: String

  var title: String
  var type: TaskType
  var content: String?
  var dueDate: Date
  var estimateTime: Int
  var importanceLevel: Int
  var urgencyLevel: Int

  var isDone: Bool

  let createdDate: Date
  var modifiedDate: Date

  static func == (lhs: Task, rhs: Task) -> Bool {
    lhs.id == rhs.id
  }

  init(
    id: String = UUID().uuidString,
    title: String,
    type: TaskType,
    content: String? = "",
    dueDate: Date,
    estimateTime: Int,
    importanceLevel: Int,
    urgencyLevel: Int,
    isDone: Bool = false,
    createdDate: Date = .now,
    modifiedDate: Date = .now
  ) {
    self.id = id
    self.title = title
    self.type = type
    self.content = content
    self.dueDate = dueDate
    self.estimateTime = estimateTime
    self.importanceLevel = importanceLevel
    self.urgencyLevel = urgencyLevel
    self.isDone = isDone
    self.createdDate = createdDate
    self.modifiedDate = modifiedDate
  }
}

// MARK: - DTO
extension Task {
  func toDTO() -> TaskDTO {
    .init(
      id: id,
      title: title,
      type: type.rawValue,
      content: content ?? "",
      dueDate: dueDate.timeIntervalSince1970,
      estimateTime: estimateTime,
      importanceLevel: importanceLevel,
      urgencyLevel: urgencyLevel,
      isDone: isDone,
      createdDate: createdDate.timeIntervalSince1970,
      modifiedDate: modifiedDate.timeIntervalSince1970
    )
  }
}

// MARK: Mutating Function
extension Task {
  mutating func setDone(_ state: Bool) {
    isDone = state
  }

  mutating func updateModifiedDate() {
    modifiedDate = .now
  }
}

