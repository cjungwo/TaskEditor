//
//  HomeView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack {
      HeaderView()

      GreetingView()

      TodayTaskListView()
    }
  }
}

// MARK: - GreetingView
private struct GreetingView: View {
  fileprivate var body: some View {
    VStack {
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

      Text("Inspiring Idea")
        .font(.system(size: 24))

      Text(Mocks.mockIdeaList[1].title)
        .frame(minHeight: 120)
    }
  }
}

// MARK: - TodayTaskList
private struct TodayTaskListView: View {
  @State var todayTaskList: [Task] = Mocks.mockTaskList

  fileprivate var body: some View {
    VStack(alignment: .leading) {
      Text("Today's \(todayTaskList.count )tasks")
        .padding(.horizontal)

      List(todayTaskList, id: \.id) { task in
        HStack {
          Button {
            task.isDone.toggle()
          } label: {
            Image(systemName: task.isDone ? "checkmark.square.fill" :  "square")
              .imageScale(.large)
          }

          VStack(alignment: .leading) {
            Text(task.title)
              .font(.title3)
              .bold()

            Text("\(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
              .font(.subheadline)
              .foregroundStyle(.secondary)
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
