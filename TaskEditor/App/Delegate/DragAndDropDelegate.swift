//
//  DragAndDropDelegate.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 15/9/2024.
//

import SwiftUI

struct DragAndDropDelegate: DropDelegate {

  let destinationItem: String
      @Binding var priorities: [String]
      @Binding var draggedItem: String?

  func dropUpdated (info: DropInfo) -> DropProposal? {
    return DropProposal (operation: .move)
  }

  func performDrop(info: DropInfo) -> Bool {
    draggedItem = nil
    return true
  }

  func dropEntered(info: DropInfo) {
          if let draggedItem {
              let fromIndex = priorities.firstIndex(of: draggedItem)
              if let fromIndex {
                  let toIndex = priorities.firstIndex(of: destinationItem)
                  if let toIndex, fromIndex != toIndex {
                      withAnimation {
                          self.priorities.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
                      }
                  }
              }
          }
      }
}
