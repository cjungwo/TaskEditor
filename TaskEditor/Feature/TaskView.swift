//
//  TaskView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 11/9/2024.
//

import SwiftUI

struct TaskView: View {
  @StateObject var viewModel = TaskViewModel()

  @State var task: Task = Mocks.mockTaskList[0]

  var body: some View {
    VStack {
      
    }
  }
}

#Preview {
  TaskView()
}
