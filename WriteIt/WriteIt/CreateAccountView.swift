//
//  CreateAccountView.swift
//  WriteIt
//
//  Created by Yashasva Sharma on 21/07/22.
//

import Foundation
import SwiftUI


struct CreateAccountView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var viewModel: AuthenticationServices
    
  var body: some View {
    VStack {
      Text("Create an account")
        .font(.title)
      TextField("Email", text: $email)
        .autocapitalization(.none)
      SecureField("Password", text: $password)
        .autocapitalization(.none)
      Button(
        "Create",
        action: {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        viewModel.signUp(email: email, password: password)
        }
      )

      Divider()

      Text("An account allows to save and access notes across devices.")
        .font(.footnote)
        .foregroundColor(.gray)
      Spacer()
    }.padding()
  }
}

struct CreateAccountView_Previews: PreviewProvider {
  static var previews: some View {
    CreateAccountView()
  }
}
