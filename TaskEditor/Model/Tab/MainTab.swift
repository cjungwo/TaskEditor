//
//  MainTab.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 13/9/2024.
//

import SwiftUI

enum MainTab: String, CaseIterable {
  case home
  case taskList
  case profile

  var icon: Image {
    switch self {
    case .home:
      VXImage.vxHomeIcon
    case .taskList:
      VXImage.vxTaskListIcon
    case .profile:
      VXImage.vxProfileIcon
    }
  }
}
