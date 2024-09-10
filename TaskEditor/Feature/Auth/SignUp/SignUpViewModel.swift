//
//  SignUpViewModel.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 10/9/2024.
//

import Foundation

class SignUpViewModel: ObservableObject {
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var fullName: String = ""
  @Published var job: String = ""
  @Published var position: String = ""
  @Published var bday: Date = Date()

  
}
