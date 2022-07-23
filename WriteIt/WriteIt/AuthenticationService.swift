//
//  AuthenticationService.swift
//  WriteIt
//
//  Created by Yashasva Sharma on 22/07/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore


class AuthenticationServices: ObservableObject {
    
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn( email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            // Success
        }
    }
    func signUp( email: String, password: String) {
        auth.createUser(withEmail: email, password: password){ [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            // Success
      }
    }
    
    func signOut(){
        try? auth.signOut()
        self.signedIn = false
    }
}

