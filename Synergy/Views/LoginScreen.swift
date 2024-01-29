//
//  LoginScreen.swift
//  Synergy
//
//  Created by Sachin Sharma on 28/01/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject var loginModel: LoginViewModel = .init()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 15) {

                // Top Welcome View
                VStack(alignment: .leading) {
                    Image(systemName: "triangle")
                        .font(.system(size: 38))
                        .foregroundStyle(.indigo)
                    
                    (Text("Welcome,")
                        .foregroundStyle(.back) +
                     Text("\nLogin to continue")
                        .foregroundStyle(.gray)
                    )
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineSpacing(10)
                    .padding(.top, 20)
                    .padding(.trailing, 15)
                }.padding(.top, 50)
                
                // MARK: custom TextField
                VStack(alignment: .leading) {
                    Group {
                        CustomTextField(hint: "+91 6505551234", text: $loginModel.mobileNo)
                            .disabled(loginModel.showOTPField)
                            .opacity(loginModel.showOTPField ? 0.4 : 1.0)
                            .overlay(alignment: .trailing, content: {
                                Button("Change") {
                                    withAnimation(.easeInOut) {
                                        loginModel.showOTPField = false
                                        loginModel.otpCode = ""
                                        loginModel.CLIENT_CODE = ""
                                    }
                                }
                                .font(.caption)
                                .foregroundStyle(.indigo)
                                .opacity(loginModel.showOTPField ? 1 : 0)
                                .padding(.trailing, 15)
                            })
                            .padding(.top, 50)
                        
                        
                        CustomTextField(hint: "OTP", text: $loginModel.otpCode)
                            .disabled(!loginModel.showOTPField)
                            .opacity(!loginModel.showOTPField ? 0.4 : 1.0)
                            .padding(.top, 30)
                    }
                    
                    Button(action: {
                        loginModel.showOTPField ? loginModel.verifyOTPCode() : loginModel.getOTPCode()
                    }, label: {
                        HStack {
                            Text(loginModel.showOTPField ? "Verify Code" : "Get Code")
                                .fontWeight(.semibold)
                                .contentTransition(.identity)
                            
                            Image(systemName: "line.diagonal.arrow")
                                .font(.title3)
                                .rotationEffect(.init(degrees: 45))
                        }
                        .foregroundStyle(.back)
                        .padding(.horizontal, 25)
                        .padding(.vertical)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.back.opacity(0.15))
                        )
                    })
                    .padding(.top, 30)
                }
                Spacer()
                
                GoogleSignInButton()

            }
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            
        }
        .alert(loginModel.errorMessage, isPresented:  $loginModel.showError) { /* */ }
    }
}

#Preview {
    LoginScreen()
}

struct GoogleSignInButton: View {
    @StateObject var loginModel: LoginViewModel = .init()
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Or")
                .padding(.bottom, 20)
            
            Button {
                loginModel.signInWithGoogle()
            } label: {
                HStack {
                    Image("Google")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                    
                    Text("Sign in with Google")
                        .foregroundStyle(.fore)
                        .font(.system(size: 18))
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.back)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
            }
            
            Spacer()
        }
    }
}
