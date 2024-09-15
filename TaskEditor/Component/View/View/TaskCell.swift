//
//  TaskCell.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 13/9/2024.
//

import SwiftUI

struct TaskCell: View {
  @EnvironmentObject var container: DIContainer

  var task: Task
  var action: () -> Void

  var body: some View {
    HStack {
      Button {
        print("DEBUG: IsDoneBtn Tapped")
        action()
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

      NavigationLink {
        TaskView(
          viewModel: .init(task: task, container: container),
          showCreateTaskView: .constant(true)
        )
      } label: {
        Image(systemName: "chevron.right")
          .imageScale(.large)
          .tint(.vxBlack)
      }
    }
    .frame(height: 52)
    .padding(.horizontal)
    .background(task.type.color.opacity(0.3))
  }
}


#Preview {
  TaskCell(task: Mocks.mockTaskList[0]) { }
}
