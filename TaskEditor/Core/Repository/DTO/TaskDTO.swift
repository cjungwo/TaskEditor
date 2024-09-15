//
//  TaskDTO.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 14/9/2024.
//

import Foundation

struct TaskDTO: Codable {
  var id: String

  var title: String
  var type: String
  var content: String
  var dueDate: TimeInterval
  var estimateTime: Int
  var importanceLevel: Int
  var urgencyLevel: Int
  var isDone: Bool

  let createdDate: TimeInterval
  var modifiedDate: TimeInterval
}

extension TaskDTO {
  func toData() -> Task {
    .init(
      id: id,
      title: title,
      type: TaskType(rawValue: type) ?? .directPerformance,
      content: content,
      dueDate: Date(timeIntervalSince1970: dueDate),
      estimateTime: estimateTime,
      importanceLevel: importanceLevel,
      urgencyLevel: urgencyLevel,
      createdDate: Date(timeIntervalSince1970: createdDate),
      modifiedDate: Date(timeIntervalSince1970: modifiedDate)
    )
  }
}
