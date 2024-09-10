//
//  SignUpView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 10/9/2024.
//

import SwiftUI

struct SignUpView: View {
  @StateObject var viewModel = SignUpViewModel()

  var body: some View {
    ZStack {
      Rectangle()
        .fill(.vxSkyblue)
        .ignoresSafeArea()

      VStack {
        HeaderView()

        SignUpFormView(viewModel: viewModel)

        GotoSignInView()

        Spacer()
      }
    }
  }
}

// MARK: - HeaderView
private struct HeaderView: View {
  fileprivate var body: some View {
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

// MARK: - SignUpFormView
private struct SignUpFormView: View {
  @ObservedObject var viewModel: SignUpViewModel

  fileprivate var body: some View {
    VStack {
      HStack {
        Text("Create Your Account")
          .font(.system(size: 24))
          .fontWeight(.bold)
          .foregroundStyle(.vxIvory)

        Spacer()
      }
      .padding(.horizontal)

      Form {
        Section("Account") {
          TextField("Email", text: $viewModel.email)
            .textFieldStyle(DefaultTextFieldStyle())
            .textInputAutocapitalization(.never)

          SecureField("Password", text: $viewModel.password)
            .textFieldStyle(DefaultTextFieldStyle())
        }

        Section("Base Info") {
          TextField("Full Name", text: $viewModel.fullName)
            .textFieldStyle(DefaultTextFieldStyle())

          DatePicker("B-Day", selection: $viewModel.bday, displayedComponents: .date)

          TextField("Your Job", text: $viewModel.job)
            .textFieldStyle(DefaultTextFieldStyle())

          TextField("Your Position", text: $viewModel.position)
            .textFieldStyle(DefaultTextFieldStyle())
        }

        LargeTextButton(
          title: "Sign Up",
          backgroundColor: .white,
          textColor: .blue
        ) {
          print("DEBUG: Sign Up Button Tapped")
        }
      }
      .frame(height: 460)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .scrollDisabled(true)
    }
  }
}

// MARK: - GotoSignInView
private struct GotoSignInView: View {
  fileprivate var body: some View {
    HStack(spacing: 4) {
      Text("Already had Account?")
        .font(.subheadline)
        .foregroundStyle(.vxBlack)
        .padding(.bottom, 4)

      Button {
        //          dismiss()
        print("DEBUG: Go To Sign In Button Tapped")
      } label: {
        Text("sign in")
          .font(.subheadline)
          .underline()
      }
      .padding(.bottom, 8)
    }
  }
}


#Preview {
  SignUpView()
}
