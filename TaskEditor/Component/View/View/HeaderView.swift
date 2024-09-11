//
//  HeaderView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 11/9/2024.
//

import SwiftUI

struct HeaderView: View {
  var body: some View {
    VStack {
      Text("TaskEditor")
        .font(.system(size: 42))
        .fontWeight(.heavy)
        .foregroundStyle(.vxIvory)
        .padding(.top, 50)
        .padding(.bottom, 24)
    }
  }
}

#Preview {
    HeaderView()
}
