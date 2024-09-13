//
//  HomeView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct HomeView: View {
  @StateObject var viewModel = HomeViewModel()

  var body: some View {
    NavigationStack {
      VStack {
        //      HeaderView()
        GreetingView()
          .padding(.bottom)

        TodayTaskListView(viewModel: viewModel)
      }
      .navigationTitle("TaskEditor")
    }
  }
}

// MARK: - GreetingView
private struct GreetingView: View {
  fileprivate var body: some View {
    VStack {
      Spacer()
        .frame(height: 16)

      HStack(spacing: 4) {
        Image(systemName: "hand.wave")
          .resizable()
          .frame(width: 36, height: 36)
          .bold()

        Text("Hi, " + Mocks.mockUser.name)
          .font(.system(size: 42))
          .fontWeight(.heavy)
      }

      Spacer()
        .frame(height: 16)
    }
  }
}

// MARK: - TodayTaskList
private struct TodayTaskListView: View {
  @ObservedObject var viewModel: HomeViewModel

  var todayTaskList: [Task] = Mocks.mockTaskList.filter {
    $0.dueDate < .now
  }

  fileprivate var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("Today's \(todayTaskList.count )tasks")

        Spacer()

        Button("Create") {
          viewModel.tappedCreateTaskBtn()
        }
      }
      .padding(.horizontal)

      ScrollView {
        VStack {
          ForEach(todayTaskList, id: \.id) { task in
            TaskCell(task: task)
          }
        }
      }
      .scrollIndicators(.hidden)
    }
  }
}

#Preview {
  HomeView()
}
