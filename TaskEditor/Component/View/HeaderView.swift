//
//  HeaderView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
      HStack {
        Text("TaskEditor")
          .font(.system(size: 36))
          .bold()

        Spacer()

        Button {
          // TODO: - 액션과 이미지를 받어서 탭마다 다른 툴바를 사용할 수 있게 하기
        } label: {
          Image(systemName: "gear")
            .imageScale(.large)
            .tint(.vxDarkblue)
        }
      }
      .padding([.horizontal, .top])
    }
}

#Preview {
    HeaderView()
}
