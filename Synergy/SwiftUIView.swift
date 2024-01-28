//
//  SwiftUIView.swift
//  Synergy
//
//  Created by Sachin Sharma on 26/01/24.
//

import SwiftUI

struct WelcomeSccreen: View {
    
    //var onSignUp: () -> Void
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    Spacer()
                    ImageTitleView()
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Log in with Apple")
                                .font(.title3)
                        }.DefaultButtonFormatting().cornerRadius(12)
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Log in with Google")
                                .font(.title3)
                        }.DefaultButtonFormatting().cornerRadius(12)
                    })
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    WelcomeSccreen()
}
