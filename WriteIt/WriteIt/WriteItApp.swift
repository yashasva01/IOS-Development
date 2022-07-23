//
//  WriteItApp.swift
//  WriteIt
//
//  Created by Yashasva Sharma on 20/07/22.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import AuthenticationServices

@main
struct WriteItApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        
        WindowGroup {
            let viewModel = AuthenticationServices()
            ContentView().environmentObject(viewModel)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
