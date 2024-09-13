//
//  TaskEditorApp.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

@main
struct TaskEditorApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  @StateObject var container: DIContainer = .init(services: Services())

  var body: some Scene {
    WindowGroup {
      AuthView(viewModel: .init(container: container))
        .environmentObject(container)
    }
  }
}
