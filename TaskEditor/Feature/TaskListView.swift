//
//  TodoListView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct TaskListView: View {
  @State var text: String = ""
    var body: some View {
      NavigationStack {
        // TODO: - priority sorting
        List {
          ForEach(Mocks.mockTaskList, id: \.id) { task in
            HStack {
              Button {
                //
              } label: {
                Image(systemName: task.isDone ? "checkmark.square.fill" : "square")
                  .imageScale(.large)
              }

              VStack(alignment: .leading) {
                Text(task.title)
                  .bold()

                if task.content != nil {
                  Text(task.content!)
                    .font(.subheadline)
                    .lineLimit(1)
                }
              }

              Spacer()

              Text("\(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
            }
          }
          .onDelete(perform: { indexSet in
            //
          })
        }
        .searchable(text: $text)
        .navigationTitle("Task List")
        .toolbar {
          ToolbarItem {
            Button("Create") {
              // TODO: - link CreateTaskView or CreateTaskSheet
            }
          }
        }
      }
    }
}

#Preview {
    TaskListView()
}
