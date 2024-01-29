//
//  HomeScreen.swift
//  Synergy
//
//  Created by Sachin Sharma on 30/01/24.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct HomeScreen: View {
    @StateObject var loginModel: LoginViewModel = .init()
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
                .navigationTitle("Home")
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem {
                        Button("Logout") {
                            showAlert.toggle()
//                            try? Auth.auth().signOut()
//                            GIDSignIn.sharedInstance.signOut()
//                            withAnimation(Animation.easeInOut) {
//                                loginModel.logStatus = false
//                            }
                        }
                    }
                }
            }
            //logout alert
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Logout"),
                    message: Text("Are you sure you want to Logout"),
                    primaryButton: .destructive(Text("Ok"), action: {
                        try? Auth.auth().signOut()
                        GIDSignIn.sharedInstance.signOut()
                        withAnimation(Animation.easeInOut) {
                            loginModel.logStatus = false
                        }
                    }),
                    secondaryButton: .cancel())
            }
        }
    }
}

#Preview {
    HomeScreen()
}
