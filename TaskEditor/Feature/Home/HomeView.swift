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

        // Greeting
        GreetingView()

        // today's todos
        
        Spacer()
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

        Text("Hi, Chris")
          .font(.system(size: 42))
          .fontWeight(.heavy)
      }

      Text("Today has " + "7" + "Tasks")
        .font(.subheadline)
    }
    .frame(minHeight: 300)
    .background(.green)
  }
}

#Preview {
    HomeView()
}
