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
    
    var body: some View {
        Group {
            if isSplashScreenVisible {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            // Hide splash screen after 2 seconds
                            withAnimation {
                                isSplashScreenVisible = false
                            }
                        }
                    }
            } else if isFirstLaunch {
                WelcomeScreen(onSignUp: {
                    // Handle signup completion
                    withAnimation {
                        isFirstLaunch = false
                    }
                })
            } else {
                SignUpScreen()
            }
        }
    }
}

#Preview {
    ContentView()
}
