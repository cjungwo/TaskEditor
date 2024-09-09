//
//  MainTabView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct MainTabView: View {
  var body: some View {
      TabView {
        HomeView()
          .tabItem {
              Image(systemName: "house")
          }

        TaskListView()
          .tabItem {
              Image(systemName: "square.and.pencil")
          }

        ProfileView()
          .tabItem {
              Image(systemName: "person")
          }
      }
      .tint(.vxDarkblue)
  }
}

#Preview {
  MainTabView()
}
