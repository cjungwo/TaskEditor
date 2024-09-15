//
//  TaskView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 11/9/2024.
//

import SwiftUI

enum TaskMode {
  case create
  case edit
}

struct TaskView: View {
  @StateObject var viewModel: TaskViewModel
  @Binding var showCreateTaskView: Bool

  var body: some View {
    VStack {
      headerView

      ScrollView {
        taskFieldView

        submitTaskView
      }

      Spacer()
        .frame(height: 100)
    }
  }

  var headerView: some View {
    VStack {
      Text("Task")
        .font(.title)
        .fontWeight(.bold)
    }
    .padding(.vertical)
  }

  var taskFieldView: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Text("Title: ")
          .font(.system(size: 16, weight: .bold))

        TextField(viewModel.task.title, text: $viewModel.title)
          .padding(.all, 4)
          .padding(.horizontal, 8)
          .background(.vxSkyblue)
          .clipShape(.buttonBorder)

        Button {
          viewModel.toggleIsDone()
        } label: {
          Image(systemName: viewModel.isDone ? "checkmark.square.fill" : "square")
            .imageScale(.large)
        }
      }

      HStack {
        Text("Type: ")
          .font(.system(size: 16, weight: .bold))

        Picker(viewModel.task.type.rawValue, selection: $viewModel.type) {
          ForEach(TaskType.allCases, id: \.self) { type in
            Text(type.rawValue)
          }
        }
        .padding(.all, 4)
        .background(.vxSkyblue)
        .clipShape(.buttonBorder)
        .tint(.vxBlack)
      }

      HStack {
        DatePicker(
          "Due Date: ",
          selection: $viewModel.dueDate
        )
        .datePickerStyle(.compact)
        .font(.system(size: 16, weight: .bold))
        .tint(.vxBlack)
      }

      HStack {
        Text("Estimate Time: ")
          .font(.system(size: 16, weight: .bold))

        Picker("\(viewModel.task.estimateTime)", selection: $viewModel.estimateTime) {
          ForEach(1...100, id: \.self) { index in
            Text("\(index)")
          }
        }
        .padding(.all, 4)
        .background(.vxSkyblue)
        .clipShape(.buttonBorder)
        .tint(.vxBlack)

        Text("h")
      }

      HStack {
        Text("Importance: ")
          .font(.system(size: 16, weight: .bold))

        Picker("\(viewModel.task.importanceLevel)", selection: $viewModel.importanceLevel) {
          ForEach(1...5, id: \.self) { index in
            Text("\(index)")
          }
        }
        .padding(.all, 4)
        .background(.vxSkyblue)
        .clipShape(.buttonBorder)
        .tint(.vxBlack)

        Spacer()

        Text("Urgency: ")
          .font(.system(size: 16, weight: .bold))

        Picker("\(viewModel.task.urgencyLevel)", selection: $viewModel.urgencyLevel) {
          ForEach(1...5, id: \.self) { index in
            Text("\(index)")
          }
        }
        .padding(.all, 4)
        .background(.vxSkyblue)
        .clipShape(.buttonBorder)
        .tint(.vxBlack)
      }

      VStack(alignment: .leading) {
        Text("Content: ")
          .font(.system(size: 16, weight: .bold))

        ScrollView {
          TextEditor(text: $viewModel.content)
            .frame(width: UIScreen.main.bounds.width - 40)
            .frame(height: 160)
            .padding(.all, 4)
            .clipShape(.buttonBorder)
            .tint(.vxBlack)
        }
        .border(.vxSkyblue)
        .frame(height: 160)
      }
    }
    .padding(.horizontal)

  }

  var submitTaskView: some View {
    VStack {
      Button {
        viewModel.createTask()
        showCreateTaskView = false
        print("DEBUG: SubmitBtn Tapped")
      } label: {
        Text("Submit")
      }
      .frame(width: 250)
      .padding()
      .background(.vxIvory)
      .clipShape(.capsule)
      .tint(.vxBlack)
    }
    .padding(.top, 16)
  }
}

#Preview {
  TaskView(
    viewModel: .init(
      task: Mocks.emptyTask,
      container: DIContainer.init(services: StubServices())
    ),
    showCreateTaskView: .constant(true)
  )
}
