//
//  TodoListView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct TaskListView: View {
  @StateObject var viewModel = TaskListViewModel()

  var body: some View {
    NavigationStack {
      VStack {
        // HeaderView

        ScrollView {
          VStack {
            ForEach(Mocks.mockTaskList, id: \.id) { task in
              TaskCell(task: task)
            }
            .searchable(text: $viewModel.searchText)
          }
        }
        .navigationTitle("Task List")
        .toolbar {
          ToolbarItem {
            Button("Create") {
              viewModel.tappedCreateTaskBtn()
            }
          }
        }
        .sheet(isPresented: $viewModel.showCreateTaskView) {
          CreateTaskSheet()
        }
      }
    }
  }
}

// MARK: - CreateTaskSheet
struct CreateTaskSheet: View {
  var body: some View {
    VStack {
      Text("Create Task")


    }
  }
}

#Preview {
  TaskListView()
}
