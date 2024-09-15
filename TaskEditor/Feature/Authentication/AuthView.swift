//
//  AuthView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 14/9/2024.
//

import SwiftUI

struct AuthView: View {
  @EnvironmentObject var container: DIContainer

  @StateObject var viewModel: AuthViewModel

    var body: some View {
      ZStack {
        switch viewModel.authState {
        case .unauthenticated:
          SignInView()
        case .authenticated:
          MainTabView(viewModel: TaskListViewModel(container: container))
            .environmentObject(container)
        }
      }
      .onAppear {
        viewModel.createUser()
        viewModel.signIn()
      }
    }
}

#Preview {
  AuthView(viewModel: .init(container: .init(services: StubServices())))
    .environmentObject(DIContainer(services: StubServices()))
}
