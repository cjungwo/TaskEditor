//
//  AuthView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 14/9/2024.
//

import SwiftUI

struct AuthView: View {
  @StateObject var viewModel: AuthViewModel

    var body: some View {
      switch viewModel.authState {
      case .unauthenticated:
        SignInView()
      case .authenticated:
        MainTabView()
      }
    }
}

#Preview {
  AuthView(viewModel: .init(container: .init(services: StubServices())))
    .environmentObject(DIContainer(services: StubServices()))
}
