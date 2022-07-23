//
//  ContentView.swift
//  WriteIt
//
//  Created by Yashasva Sharma on 20/07/22.
//
import SwiftUI
import AuthenticationServices




struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthenticationServices
    
    var body: some View {
        
        NavigationView {
            if viewModel.signedIn {
                VStack{
                    //NoteListView()
                    Text("You are Signed In")
                    
                    
                    Button(action: {
                        viewModel.signOut()
                    },label: {
                        Text("Sign Out")
                    })
                }
                
            }else {
                SignInView()
            }
        }.onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}


struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var viewModel: AuthenticationServices
    
    var body: some View {
            VStack {
                WelcomeText()
                LogoImage()
                TextField("Username", text: $email)
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .autocapitalization(.none)
                SecureField("Password", text: $password)                             .autocapitalization(.none)
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                
                Button("Login",
                    action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signIn(email: email, password: password)
                }
                        )
                Divider()
            NavigationLink(destination: CreateAccountView()) {
                       Text("Don't have an account?").foregroundColor(.gray)
                       Text("Create an account")
                     }.font(.footnote)
                Spacer()
            }.padding(.horizontal)
        }
       
}


struct WelcomeText: View{
    var body: some View {
        return Text("Welcome").font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct LogoImage: View{
    var body: some View {
        return Image("logoImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
