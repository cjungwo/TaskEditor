//
//  User.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import Foundation

struct User: Identifiable, Equatable {
  let id: String = UUID().uuidString
  
  let email: String
  let password: String

  var name: String
  var birthDate: Date
  var gender: Bool
  var job: String
  var position: String
  var priorityList: [String] // TODO: - enum

  init(
    email: String,
    password: String,
    name: String,
    birthDate: Date,
    gender: Bool,
    job: String,
    position: String,
    priorityList: [String]
  ) {
    self.email = email
    self.password = password
    self.name = name
    self.birthDate = birthDate
    self.gender = gender
    self.job = job
    self.position = position
    self.priorityList = priorityList
  }

}
