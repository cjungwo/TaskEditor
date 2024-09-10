//
//  Todo.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import Foundation

struct Task: Hashable, Identifiable {
  let id = UUID().uuidString

  var title: String
  var type: String
  var content: String?
  var dueDate: Date
  var estimateTime: Int
  var importanceLevel: Int
  var urgencyLevel: Int
  var isDone: Bool

  let createdDate: Date
  var modifiedDate: Date

  init(
    title: String,
    type: String,
    content: String? = nil,
    dueDate: Date,
    estimateTime: Int,
    importanceLevel: Int,
    urgencyLevel: Int,
    isDone: Bool = false,
    createdDate: Date = .now,
    modifiedDate: Date = .now
  ) {
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
