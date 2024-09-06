//
//  User.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import Foundation

struct User: Identifiable, Equatable {
  let id: String = UUID().uuidString
  var name: String
  var birthDate: Date
  var gender: Bool
  var job: String
  var position: String
  var typePriorityList: [String] // TODO: - enum

  init(
    name: String,
    birthDate: Date,
    gender: Bool,
    job: String,
    position: String,
    typePriorityList: [String]
  ) {
    self.name = name
    self.birthDate = birthDate
    self.gender = gender
    self.job = job
    self.position = position
    self.typePriorityList = typePriorityList
  }
}
