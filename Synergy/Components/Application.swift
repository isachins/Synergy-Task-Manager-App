//
//  Application.swift
//  Synergy
//
//  Created by Sachin Sharma on 29/01/24.
//

import SwiftUI
import UIKit

// For Google sign in
final class Applicaiton_utility {
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
