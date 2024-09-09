//
//  ProfileView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
    NavigationStack {
      VStack {
        ProfileHeaderView()
          .padding(.bottom, 24)

        CurrentStatusView()

        Divider()

        VStack(alignment: .leading) {
          Text("BIO")
            .font(.system(size: 24))
            .fontWeight(.heavy)

          HStack {
            Text("Gender |")

            Mocks.mockUser.gender ? Text("Male") : Text("Female")

            Spacer()
          }

          HStack {
            Text("BDay |")

            Text("\(Mocks.mockUser.birthDate.formatted(date: .abbreviated, time: .omitted))")

            Spacer()
          }

          HStack {
            Text("Job |")

            Text("\(Mocks.mockUser.position) \(Mocks.mockUser.job)")

            Spacer()
          }

          HStack(alignment: .top) {
            Text("Priorities |")

            VStack {
              Text("1st: \(Mocks.mockUser.priorityList[0]) ")

              Text("2nd: \(Mocks.mockUser.priorityList[1]) ")

              Text("3rd: \(Mocks.mockUser.priorityList[2])")
            }

            Spacer()
          }
        }
        .padding(.horizontal)

        Spacer()
      }
      .navigationTitle("Profile")
      .toolbar {
        ToolbarItem {
          NavigationLink {
            SettingView()
          } label: {
            Image(systemName: "gear")
          }
        }
      }
    }
  }
}

// MARK: - ProfileHeaderView
private struct ProfileHeaderView: View {
  fileprivate var body: some View {
    VStack {
      Image(systemName: "person.circle.fill")
        .resizable()
        .frame(width: 82, height: 82)
        .foregroundStyle(.vxOrange)
        .overlay {
          Circle()
            .fill(.vxDarkblue)
            .frame(width: 24, height: 24)
            .offset(x: 28, y: 28)
            .overlay {
              Image(systemName: "pencil")
                .resizable()
                .frame(width: 12, height: 12)
                .bold()
                .offset(x: 28, y: 28)
                .foregroundStyle(.vxWhite)
            }
        }

      Text(Mocks.mockUser.name)
        .font(.system(size: 24))
        .bold()
    }
  }
}

// MARK: - CurrentStatusView
private struct CurrentStatusView: View {
  fileprivate var body: some View {
    HStack {
      VStack(spacing: 16) {
        Text("Task")
          .font(.system(size: 16))

        Text("\(Mocks.mockTaskList.count)")
          .font(.system(size: 30))
          .bold()
      }
    }
  }
}

// MARK: - SettingNavigationView
private struct SettingNavigationView: View {
  fileprivate var body: some View {
    VStack {

    }
  }
}

#Preview {
  ProfileView()
}
