//
//  HomeView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var container: DIContainer

  @StateObject var viewModel = HomeViewModel()

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

        Text("Hi, " + (viewModel.user?.name ?? Mocks.mockUser.name))
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
        Text("Today's \(viewModel.tasks.count)tasks")

        Spacer()

        Button("Create") {
          viewModel.tappedCreateTaskBtn()
        }
      }
      .padding(.horizontal)

      ScrollView {
        VStack {
          ForEach(viewModel.tasks, id: \.id) { task in
            TaskCell(task: task)
          }
        }
      }
      .scrollIndicators(.hidden)
    }
  }

  // MARK: - emptyTaskListView
  private var emptyTaskListView: some View {
    VStack {
      Text("Today hasn't any task.")

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

      Spacer()
    }
  }
}

#Preview {
  HomeView()
    .environmentObject(DIContainer(services: StubServices()))
}
