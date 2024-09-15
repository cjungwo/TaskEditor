//
//  MainTabView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct MainTabView: View {
  @EnvironmentObject var container: DIContainer
  @StateObject var viewModel: TaskListViewModel

  var body: some View {
    TabView {
      HomeView()
        .environmentObject(viewModel)
        .environmentObject(container)
        .tabItem {
          Label {
            Text(MainTab.home.rawValue.capitalized)
          } icon: {
            MainTab.home.icon
          }
        }

      TaskListView()
        .environmentObject(viewModel)
        .environmentObject(container)
        .tabItem {
          Label {
            Text(MainTab.taskList.rawValue.capitalized)
          } icon: {
            MainTab.taskList.icon
          }
        }
      ProfileView(viewModel: .init(container: container))
        .tabItem {
          Label {
            Text(MainTab.profile.rawValue.capitalized)
          } icon: {
            MainTab.profile.icon
          }
        }
    }
    .tint(.vxDarkblue)
  }
}

#Preview {
  MainTabView(viewModel: TaskListViewModel(container: DIContainer(services: StubServices())))
    .environmentObject(DIContainer(services: StubServices()))
}
