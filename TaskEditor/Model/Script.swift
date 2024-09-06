//
//  Script.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 5/9/2024.
//

import Foundation

class Script {
  let id: String = UUID().uuidString
  var title: String
  var content: String?
  var createdDate: Date
  var modifiedDate: Date

  init(
    title: String,
    content: String? = nil,
    createdDate: Date,
    modifiedDate: Date
  ) {
    self.title = title
    self.content = content
    self.createdDate = createdDate
    self.modifiedDate = modifiedDate
  }
}
