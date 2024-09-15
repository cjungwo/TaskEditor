//
//  UserDTO.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 15/9/2024.
//

import Foundation

struct UserDTO: Codable {
  var id: String
  let email: String
  let password: String
  var name: String
  var birthDate: TimeInterval
  var job: String
  var position: String
  var priorityList: String
}

extension UserDTO {
  func toData() -> User {
    .init(
      id: id,
      email: email,
      password: password,
      name: name,
      birthDate: Date(timeIntervalSince1970: birthDate),
      job: job,
      position: position,
      priorityList: changePriorityListForm()
    )
  }

  func changePriorityListForm() -> [TaskType] {
    var newPriorityList: [TaskType] = []
    let arr = priorityList.split(separator: ", ")

    print(arr)

    for priority in arr {
      switch priority {
      case TaskType.directPerformance.rawValue:
        newPriorityList.append(.directPerformance)
      case TaskType.indirectPerformance.rawValue:
        newPriorityList.append(.indirectPerformance)
      case TaskType.personalWork.rawValue:
        newPriorityList.append(.personalWork)
      case TaskType.selfDevelopment.rawValue:
        newPriorityList.append(.selfDevelopment)
      case TaskType.humanNetwork.rawValue:
        newPriorityList.append(.humanNetwork)
      default:
        print("ERROR: error")
      }
    }

    return newPriorityList
  }
}
