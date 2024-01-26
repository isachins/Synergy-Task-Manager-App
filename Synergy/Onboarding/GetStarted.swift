//
//  GetStarted.swift
//  Synergy
//
//  Created by Sachin Sharma on 26/01/24.
//

import SwiftUI

//for single screen
struct GetStarted: View {
    
    @State var firstTime: Bool = false
    //@AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    var body: some View {
//        Group {
//            if isFirstLaunch {
//                WelcomeView()
//            } else {
//                Signup()
//            }
//        }
//        .onChange(of: isFirstLaunch) { newValue in
//            // Update the flag in UserDefaults when the welcome screen is dismissed
//            if !newValue {
//                //UserDefaults.standard.set(false, forKey: "isFirstLaunch")
//            }
//        }
        Text("Hello")
    }
}

#Preview {
    GetStarted()
}
