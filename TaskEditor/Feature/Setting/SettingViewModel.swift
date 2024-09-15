//
//  SettingViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import Foundation

class SettingViewModel: ObservableObject {
  @Published var user: User = Mocks.mockUser
  @Published var draggedPriority: String?
  @Published var priorities: [String] = []

  
}
