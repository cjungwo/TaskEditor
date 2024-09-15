//
//  HomeView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI
import FirebaseFirestore

struct HomeView: View {
  @EnvironmentObject var container: DIContainer
  @EnvironmentObject var viewModel: TaskListViewModel

  var body: some View {
    NavigationStack {
      VStack {
        greetingView
          .padding(.bottom)

        if !viewModel.tasks.isEmpty {
          todayTaskListView
        } else {
          emptyTaskListView
        }
      }
      .navigationTitle("TaskEditor")
      .sheet(isPresented: $viewModel.showCreateTaskView,
             content: {
        TaskView(
          viewModel: .init(task: Mocks.emptyTask, container: container),
          showCreateTaskView: $viewModel.showCreateTaskView
        )
      })
    }
  }


  // MARK: - greetingView
  private var greetingView: some View {
    VStack {
      Spacer()
        .frame(height: 16)

      HStack(spacing: 4) {
        Image(systemName: "hand.wave")
          .resizable()
          .frame(width: 36, height: 36)
          .bold()

        Text("Hi, " + (viewModel.user.name))
          .font(.system(size: 42))
          .fontWeight(.heavy)
      }

      Spacer()
        .frame(height: 16)
    }
  }

  // MARK: - todayTaskList
  private var todayTaskListView: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("Today's \(viewModel.getTodayTasks().count)tasks")

        Spacer()

        Button("Create") {
          viewModel.tappedCreateTaskBtn()
        }
      }
      .padding(.horizontal)

      ScrollView {
        VStack {
          ForEach(viewModel.orderPriorityOfTodayTasks(), id: \.id) { task in
            TaskCell(task: task) {
              viewModel.toggleIsDone(task: task)
            }
          }
        }
      }
      .scrollIndicators(.hidden)
    }
  }

  // MARK: - emptyTaskListView
  private var emptyTaskListView: some View {
    VStack(spacing: 16) {
      Text("Today hasn't any task.")

      Spacer()

      Group {
        Button {
          viewModel.tappedCreateTaskBtn()
        } label: {
          Text("Create today's task")
        }

        Button {
          viewModel.tappedGoToTaskListBtn()
        } label: {
          Text("View other tasks")
        }
      }
      .frame(width: 250)
      .padding()
      .background(.vxIvory)
      .clipShape(.capsule)
      .tint(.vxBlack)

      Spacer()
    }
  }
}

#Preview {
  HomeView()
    .environmentObject(TaskListViewModel(container: DIContainer(services: StubServices())))
    .environmentObject(DIContainer.init(services: StubServices()))
}
