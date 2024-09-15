//
//  TodoListView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct TaskListView: View {
  @EnvironmentObject var container: DIContainer
  @EnvironmentObject var viewModel: TaskListViewModel


  var body: some View {
    NavigationStack {
      VStack {
        // HeaderView

        ScrollView {
          VStack {
            ForEach(viewModel.filteredTasks, id: \.id) { task in
              TaskCell(task: task) {
                viewModel.toggleIsDone(task: task)
              }
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
          TaskView(
            viewModel: .init(task: Mocks.emptyTask, container: container),
            showCreateTaskView: $viewModel.showCreateTaskView
          )
        }
        .onAppear {
          viewModel.updateTasks()
        }
      }
    }
  }
}

#Preview {
  TaskListView()
    .environmentObject(TaskListViewModel(container: DIContainer(services: StubServices())))
    .environmentObject(DIContainer(services: StubServices()))
}
