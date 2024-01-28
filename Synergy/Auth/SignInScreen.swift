//
//  SignInScreen.swift
//  Synergy
//
//  Created by Sachin Sharma on 27/01/24.
//

import SwiftUI

//struct SignInScreen: View {
//    
//    
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                FeildsView()
//                    .padding()
//                
//                //OtherLoginButtons()
//            }
//            .navigationTitle("Log In")
//    .onAppear {
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { (notification) in
//            // Adjust the view when the keyboard appears
//            withAnimation {
//                // You may need to adjust the value based on your UI
//                // or calculate the keyboard height dynamically
//                scrollViewOffset = -100
//            }
//        }
//
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
//            // Reset the view when the keyboard hides
//            withAnimation {
//                scrollViewOffset = 0
//            }
//        }
//    }
//        }
//    }
//}

#Preview {
    SignInScreen()
}

struct SignInScreen1: View {
    
    enum Field {
        case email, password
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var scrollViewOffset: Int = 0
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Group {
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
                }
                
                
                
                VStack(spacing: 18) {
                    Button(action: {}, label: {
                        Text("Login")
                            .DefaultButtonFormatting()
                    }).padding(.vertical)
                    
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
                .padding()
                .navigationTitle("Log in")
        }
    }
}

struct SignInScreen: View {
    enum Field {
        case email, password
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var scrollViewOffset: CGFloat = 0
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Group {
                        Text("Email")
                            .font(Font.custom("Poppins-Light", size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.back)
                        
                        TextField("Username", text: $email)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundStyle(.back)
                            .background(.gray.opacity(0.35))
                            .cornerRadius(10)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
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
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundStyle(.back)
                            .background(.gray.opacity(0.35))
                            .cornerRadius(10)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .keyboardType(.alphabet)
                            .submitLabel(.done)
                            .focused($focusField, equals: .password)
                            .onSubmit {
                                focusField = nil
                            }
                        
                        Button(action: {}, label: {
                            Text("Login")
                                .DefaultButtonFormatting()
                        }).padding(.vertical)
                    }
                    
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
                        }.padding([.top], 20)
                        
                        NavigationLink(destination: SignUpScreen()) {
                            Text("Sign up")
                                .DefaultButtonFormatting()
                                .padding([.top])
                        }
//                        Button(action: {
//                            NavigationLink("Sign up Screen", destination: SignUpScreen())
//                        }, label: {
//                            Text("Sign up")
//                                .DefaultButtonFormatting()
//                        })
                    }
                }.padding(.vertical)
                .padding()
                .onTapGesture {
                    // End editing when tapping outside text fields
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            }
            .scrollIndicators(.hidden)
            .navigationBarTitle("Log in", displayMode: .large)
        }
    }
}


struct OtherLoginButtons: View {
    var body: some View {
        Text("Hello")
    }
}
