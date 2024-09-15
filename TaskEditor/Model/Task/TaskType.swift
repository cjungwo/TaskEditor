//
//  TaskType.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 11/9/2024.
//

import SwiftUI

enum TaskType: String, CaseIterable {
  case directPerformance = "Direct Performance"
  case indirectPerformance = "Indirect Performance"
  case personalWork = "Personal Work"
  case selfDevelopment = "Self Development"
  case humanNetwork = "Human Network"

  var color: Color {
    switch self {
    case .directPerformance:
        .vxDirectPerformance
    case .indirectPerformance:
        .vxIndirectPerformance
    case .personalWork:
        .vxPersonalWork
    case .selfDevelopment:
        .vxSelfDevelopment
    case .humanNetwork:
        .vxHumanNetwork
    }
  }
}
