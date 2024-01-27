//
//  LaunchScreen.swift
//  Synergy
//
//  Created by Sachin Sharma on 27/01/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var size = 0.7
    @State private var opacity = 0.4
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                Image("getStarted1")
                    .resizable()
                    .scaledToFit()
                
                Text("Welcome to the Synergy")
                    .font(Font.custom("Poppins-Bold", size: 36))
                    .multilineTextAlignment(.center)
                
                Text("All tasks, meetings and annual plans in one place are always at hand")
                    .font(Font.custom("Poppins-Light", size: 20))
                    .foregroundStyle(.back.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                Spacer()
            }
            .padding()
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.0)) {
                    self.size = 1.0
                    self.opacity = 1.0
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
