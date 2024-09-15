//
//  ProfileView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewModel: ProfileViewModel

  var body: some View {
    NavigationStack {
      VStack {
        if let user = viewModel.user {
          UserInfo(viewModel: viewModel, user: user)
            .padding()

          Spacer()
        } else {
          Text("Loading Profile ...")
        }
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
      .onAppear {
        viewModel.fetchUser()
      }
    }
  }
}

private struct UserInfo: View {
  @ObservedObject var viewModel: ProfileViewModel

  var user: User

  fileprivate var body: some View {
    VStack {
    
            profileHeaderView
              .padding(.vertical, 24)
    
            currentStatusView
    
            Divider()
    
            basicUserInfoView
              .padding(.horizontal)
    
            Spacer()
          }
  }

  // MARK: - ProfileHeaderView
  var profileHeaderView: some View {
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

      Text(user.name)
        .font(.system(size: 24))
        .bold()
    }
  }

  // MARK: - CurrentStatusView
  var currentStatusView: some View {
    HStack {
      VStack(spacing: 16) {
        Text("Today")
          .font(.system(size: 16))

        Text("\(viewModel.getTodayTasks())")
          .font(.system(size: 30))
          .bold()
      }

      Spacer()
        .frame(width: 100)

      VStack(spacing: 16) {
        Text("Total")
          .font(.system(size: 16))

        Text("\(viewModel.getTasks())")
          .font(.system(size: 30))
          .bold()
      }
    }
  }

  // MARK: - basicUserInfoView
  var basicUserInfoView: some View {
    VStack(alignment: .leading) {
      Text("BIO")
        .font(.system(size: 24))
        .fontWeight(.heavy)
        .padding(.bottom, 8)

      HStack {
        Text("BDay |")
          .font(.system(size: 16, weight: .bold))

        Text("\(user.birthDate.formatted(date: .abbreviated, time: .omitted))")

        Spacer()
      }

      HStack {
        Text("Job |")
          .font(.system(size: 16, weight: .bold))

        Text("\(user.position ?? " ") \(user.job ?? " ")")

        Spacer()
      }

      HStack(alignment: .top) {
        Text("Priority Order |")
          .font(.system(size: 16, weight: .bold))

        VStack(alignment: .leading) {
          ForEach(user.priorityList, id: \.self) { priority in
            Text("\(priority.rawValue.capitalized)")
              .background(priority.color.opacity(0.5))
          }
        }
      }

      Spacer()
    }
  }
}

#Preview {
  ProfileView(viewModel: .init(container: .init(services: StubServices())))
}
