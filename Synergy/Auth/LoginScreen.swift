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
                
                // MARK: custom TextField
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
                            .fill(.back.opacity(0.1))
                    )
                })
                .padding(.top, 30)
                
                Spacer()
                
                VStack(alignment: .center) {
                    Spacer()
                    Text("Or")
                        .padding(.bottom, 20)
                    
                    Button {
                        //
                    } label: {
                        HStack {
                            Image("Google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                            
                            Text("Sign in with Google")
                                .foregroundStyle(.white)
                                .font(.system(size: 18))
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                    }
                    
                    Spacer()
                    
                    
                    Text("Don't have an account")
                        .padding(.bottom, 20)
                        .padding(.top, 50)
                    
                    Button {
                        //
                    } label: {
                        HStack {
                            Text("Sign up")
                                .foregroundStyle(.white)
                                .font(.system(size: 18))
                                .lineLimit(1)
                            
                            Image(systemName: "line.diagonal.arrow")
                                .resizable()
                                .scaledToFit()
                                .rotationEffect(.init(degrees: 45))
                                .foregroundStyle(.white)
                                .frame(width: 18, height: 18)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                    }
                }

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
