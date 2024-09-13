//
//  TaskCell.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 13/9/2024.
//

import SwiftUI

struct TaskCell: View {
  var task: Task
  var backgroundColor: Color

  init(task: Task) {
    self.task = task
    backgroundColor = switch task.type {
    case "Direct Performance":
        .vxDirectPerformance
    case "Indirect Performance":
        .vxIndirectPerformance
    case "Personal Work":
        .vxPersonalWork
    case "Self Development":
        .vxSelfDevelopment
    case "Human Network":
        .vxHumanNetwork
    default:
        .vxWhite
    }
  }

  var body: some View {
    HStack {
      Button {
       print("DEBUG: IsDoneBtn Tapped")
      } label: {
        Image(systemName: task.isDone ? "checkmark.square.fill" : "square")
          .imageScale(.large)
          .tint(.vxBlack)
      }

      VStack(alignment: .leading) {
        HStack(spacing: 0) {
          Text(task.title)
            .bold()

          Text(" - \(task.importanceLevel)/\(task.urgencyLevel)")
            .font(.system(size: 12))
        }

        if let content =  task.content {
          Text(content)
            .font(.subheadline)
            .lineLimit(1)
        }
      }

      Spacer()

      Text("\(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
    }
    .frame(height: 52)
    .padding(.horizontal)
    .background(backgroundColor.opacity(0.3))
  }
}


#Preview {
  TaskCell(task: Mocks.mockTaskList[0])
}
