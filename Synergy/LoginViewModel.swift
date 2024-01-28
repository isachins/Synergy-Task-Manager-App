//
//  LoginViewModel.swift
//  Synergy
//
//  Created by Sachin Sharma on 28/01/24.
//

import Foundation
import Firebase
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
    
    //MARK: Firebase API's
    func getOTPCode() {
        UIApplication.shared.closeKeyboard()
        Task {
            do {
                //MARK: Disable it when testing with Real Devices
                Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                
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
                
            } catch {
                await handleError(error: error)
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
