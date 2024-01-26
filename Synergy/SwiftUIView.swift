//
//  SwiftUIView.swift
//  Synergy
//
//  Created by Sachin Sharma on 26/01/24.
//

import SwiftUI


struct SwiftUIView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    var body: some View {
        Group {
            if isFirstLaunch {
                //WelcomeScreen()
                SplashScreen()
            } else {
                MainScreen()
            }
        }
        .onChange(of: isFirstLaunch) { newValue in
            // Update the flag in UserDefaults when the welcome screen is dismissed
            if !newValue {
                UserDefaults.standard.set(false, forKey: "isFirstLaunch")
            }
        }
    }
}

struct WelcomeSccreen: View {
    var body: some View {
        VStack {
            Text("Welcome to Your App!")
            // Add your welcome screen content here
            
            // Button to dismiss the welcome screen
            Button("Get Started") {
                // Dismiss the welcome screen by updating the flag
                UserDefaults.standard.set(false, forKey: "isFirstLaunch")
            }
        }
    }
}

struct MainScreen: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    var body: some View {
        VStack {
            if isFirstLaunch {
                Text("Show welcome screen or other content")
            } else {
                // Your main screen content goes here
                Text("Main Screen")
            }
        }
    }
}





#Preview {
    SwiftUIView()
}
