//
//  LoginViewModel.swift
//  Synergy
//
//  Created by Sachin Sharma on 28/01/24.
//

import Foundation
import Firebase
import GoogleSignIn
import SwiftUI

class LoginViewModel: ObservableObject {
    //MARK: View Properties
    @Published var mobileNo: String = ""
    @Published var otpCode: String = ""
    
    @Published var CLIENT_CODE: String = ""
    @Published var showOTPField: Bool = false
    
    //MARK: Error Properties
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    var phoneNumber: String = ""
    
    //MARK: check login status
    @AppStorage("log_status") var logStatus: Bool = false
    
    //MARK: For phone no otp auto
    //MARK: Firebase API's
    func getOTPCode() {
        UIApplication.shared.closeKeyboard()
        Task {
            do {
                //MARK: Disable it when testing with Real Devices
                Auth.auth().settings?.isAppVerificationDisabledForTesting = false
                
                let cleanedMobileNo = mobileNo.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                phoneNumber = "+91" + cleanedMobileNo
                
                let code = try await PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil)
                await MainActor.run {
                    CLIENT_CODE = code
                    print("Code Sent")
                    //MARK: Enabling OTP Field When It's Success
                    withAnimation(.easeInOut) {
                        showOTPField = true
                        print("otp generation success")
                    }
                }
            } catch {
                await handleError(error: error)
            }
        }
    }
    
    func verifyOTPCode() {
        UIApplication.shared.closeKeyboard()
        Task {
            do {
                let credentials = PhoneAuthProvider.provider().credential(withVerificationID: CLIENT_CODE, verificationCode: otpCode)
                
                try await Auth.auth().signIn(with: credentials)
                
                //MARK: USer Logged in Successfully
                print("Success Log in")
                await MainActor.run {
                    withAnimation(.easeInOut) {
                        logStatus = true
                    }
                }
                
            } catch {
                await handleError(error: error.localizedDescription as! Error)
            }
        }
    }
    
    //MARK: FOr Sign in with Google Auth
    func signInWithGoogle() {
        //get app client id
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        //Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        //sign In method goes here...
        GIDSignIn.sharedInstance.signIn(withPresenting: Applicaiton_utility.rootViewController) { user, error in
            
            //handle errors
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard
                let user = user?.user,
                let idToken = user.idToken else { return }
            
            let accessToken = user.accessToken
            
            let credentials = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credentials) { res, error in
                if let error = error {
                    print(error.localizedDescription)
                    self.errorMessage = error.localizedDescription
                    self.showError.toggle()
                    return
                }
                
                guard let user = res?.user else { return }
                print(user)
                withAnimation(.easeInOut) {
                    self.logStatus = true
                }
            }
            
        }
        
    }
    
    
    
    
    //MARK: Handling Error
    func handleError(error: Error) async {
        await MainActor.run {
            errorMessage = error.localizedDescription
            showError.toggle()
        }
    }
    
}

//MARK: Extensions
extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
