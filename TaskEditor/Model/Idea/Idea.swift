//
//  Memo.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import Foundation

class Idea: Script {
  var isImportant: Bool
  var ideaType: String // TODO: - enum 

  init(
    title: String,
    content: String? = nil,
    createdDate: Date,
    modifiedDate: Date,
    isImportant: Bool,
    ideaType: String
  ) {
    self.isImportant = isImportant
    self.ideaType = ideaType
    super.init(title: title, content: content, createdDate: createdDate, modifiedDate: modifiedDate)
  }
}
