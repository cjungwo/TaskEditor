//
//  DIContainer.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 13/9/2024.
//

import Foundation

class DIContainer: ObservableObject {
  var services: ServiceType

  init(services: ServiceType) {
    self.services = services
  }
}
