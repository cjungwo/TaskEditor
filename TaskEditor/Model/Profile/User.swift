//
//  User.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import Foundation

struct User {
  var id: String
  
  let email: String
  let password: String

  var name: String
  var birthDate: Date
  var job: String?
  var position: String?
  var priorityList: [TaskType] = []

  init(
    id: String = UUID().uuidString,
    email: String,
    password: String,
    name: String,
    birthDate: Date,
    job: String?,
    position: String?,
    priorityList: [TaskType]
  ) {
    self.id = id
    self.email = email
    self.password = password
    self.name = name
    self.birthDate = birthDate
    self.job = job
    self.position = position
    self.priorityList = priorityList
  }

}

extension User {
  func toDTO() -> UserDTO {
    .init(
      id: id,
      email: email,
      password: password,
      name: name,
      birthDate: birthDate.timeIntervalSince1970,
      job: job ?? "",
      position: position ?? "",
      priorityList: changePriorityListForm()
    )
  }

  func changePriorityListForm() -> String {
    var newPriorityList: String = ""

    for priority in priorityList {
      newPriorityList += "\(priority.rawValue), "
    }

    return newPriorityList
  }
}
