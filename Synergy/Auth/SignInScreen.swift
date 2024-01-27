//
//  SignInScreen.swift
//  Synergy
//
//  Created by Sachin Sharma on 27/01/24.
//

import SwiftUI

struct SignInScreen: View {
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                FeildsView()
                    .padding()
                
                //OtherLoginButtons()
            }
            .navigationTitle("Log In")
        }
    }
}

#Preview {
    SignInScreen()
}

struct FeildsView: View {
    enum Field {
        case email, password
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Email")
                    .font(Font.custom("Poppins-Light", size: 18))
                    .fontWeight(.semibold)
                    .foregroundStyle(.back)
                TextField("Username", text: $email)
                    .padding()
                    .DefaultTextFeildFormatting()
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .focused($focusField, equals: .email)
                    .onSubmit {
                        focusField = .password
                    }
                
                Text("Password")
                    .font(Font.custom("Poppins-Light", size: 18))
                    .fontWeight(.semibold)
                    .foregroundStyle(.back)
                TextField("Password", text: $password)
                    .padding()
                    .DefaultTextFeildFormatting()
                    .keyboardType(.alphabet)
                    .submitLabel(.done)
                    .focused($focusField, equals: .password)
                    .onSubmit {
                        focusField = nil
                    }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Login")
                        .DefaultButtonFormatting()
                }).padding(.vertical)
                
                VStack(spacing: 18) {
                    HStack {
                        Spacer()
                        Text("Or Login with")
                            .font(Font.custom("Poppins-Light", size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.back)
                        Spacer()
                    }.padding([.top])
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Log in with Apple")
                                .font(.title3)
                        }.DefaultButtonFormatting()
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Log in with Google")
                                .font(.title3)
                        }.DefaultButtonFormatting()
                        
                    })
                    
                    HStack {
                        Spacer()
                        Text("Don't have an account")
                            .font(Font.custom("Poppins-Light", size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.back)
                        Spacer()
                    }.padding([.top])
                    
                    Button(action: {
                        NavigationLink("Sign up Screen", destination: SignUpScreen())
                    }, label: {
                        Text("Sign up")
                            .DefaultButtonFormatting()
                    })
                    
                }
            }.padding(.vertical)
        }
    }
}

struct OtherLoginButtons: View {
    var body: some View {
        Text("Hello")
    }
}
