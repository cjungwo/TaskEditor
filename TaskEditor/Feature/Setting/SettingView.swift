//
//  SettingView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct SettingView: View {
  @StateObject var viewModel =  SettingViewModel()

  var body: some View {
    VStack {
      ForEach(viewModel.user.priorityList, id: \.self) { priority in
        HStack {
          Text(priority.rawValue)
        }
        .frame(height: 36)
        .background(priority.color)
          .onDrag({
            viewModel.draggedPriority = priority.rawValue
            return NSItemProvider()
          })
          .onDrop(of: [.text],
                  delegate: DragAndDropDelegate(destinationItem: priority.rawValue, priorities: $viewModel.priorities, draggedItem: $viewModel.draggedPriority)
              )
      }
    }
  }
}

#Preview {
  SettingView()
}
