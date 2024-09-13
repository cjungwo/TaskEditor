//
//  MainTabView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct MainTabView: View {
  @EnvironmentObject var container: DIContainer

  var body: some View {
    TabView {
      ForEach(MainTab.allCases, id: \.self) { tab in
        Group {
          switch tab {
          case .home:
            HomeView()
              .environmentObject(container)
          case .taskList:
            TaskListView()
          case .profile:
            ProfileView()
          }
        }
        .tabItem {
          Label {
            Text(tab.rawValue.capitalized)
          } icon: {
            tab.icon
          }
        }
      }
      }
      .tint(.vxDarkblue)
  }
}

#Preview {
  MainTabView()
    .environmentObject(DIContainer.init(services: StubServices()))
}
