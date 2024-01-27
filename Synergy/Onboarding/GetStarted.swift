//
//  GetStarted.swift
//  Synergy
//
//  Created by Sachin Sharma on 26/01/24.
//

import SwiftUI

//for single screen
struct GetStarted: View {
    
    var onSignUp: () -> Void
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    ImageTitleView()
                    
                    Spacer()
                    Button(action: {
                        onSignUp()
                    }, label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.fore)
                            .frame(width: 75, height: 75)
                            .background(Color.back)
                            .clipShape(Circle())
                            .shadow(radius: 7, x: 5, y: 3)
                    })
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

//#Preview {
//    WelcomeScreen1()
//}

struct ImageTitleView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image("getStarted1")
                .resizable()
                .scaledToFit()
            
            Text("Welcome to the Synergy")
                .font(Font.custom("Poppins-Bold", size: 36))
                .multilineTextAlignment(.center)
            
            Text("All tasks, meetingsand annual plans in one place are always at hand")
                .font(Font.custom("Poppins-Light", size: 20))
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
