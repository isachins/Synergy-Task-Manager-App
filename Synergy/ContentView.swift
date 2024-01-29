//
//  ContentView.swift
//  Synergy
//
//  Created by Sachin Sharma on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @State private var isSplashScreenVisible: Bool = true
    
    @StateObject var loginModel: LoginViewModel = .init()
    
    var body: some View {
        Group {
            if isSplashScreenVisible {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            // Hide splash screen after 2 seconds
                            withAnimation(Animation.easeInOut) {
                                isSplashScreenVisible = false
                            }
                        }
                    }
            } else if isFirstLaunch {
                GetStarted(onSignUp: {
                    // Handle signup completion
                    withAnimation(Animation.easeInOut) {
                        isFirstLaunch = false
                    }
                })
            } else {
                if loginModel.logStatus {
                    //MARK: Your Home View
                    HomeScreen()
                } else {
                    LoginScreen()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
