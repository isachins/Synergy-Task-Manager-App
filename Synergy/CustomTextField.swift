//
//  CustomTextField.swift
//  Synergy
//
//  Created by Sachin Sharma on 28/01/24.
//

import SwiftUI

struct CustomTextField: View {
    var hint: String
    @Binding var text: String
    
    //MARK: View Properties
    @FocusState var isEnabled: Bool
    var contentType: UITextContentType = .telephoneNumber
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField(hint, text: $text)
                .keyboardType(.numberPad)
                .textContentType(contentType)
                .focused($isEnabled)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.back.opacity(0.2))
                
                Rectangle()
                    .fill(.back)
                    .frame(width: isEnabled ? nil : 0, alignment: .leading)
                    .animation(.easeInOut(duration: 0.2), value: isEnabled)
            }
            .frame(height: 2)
        }
    }
}

#Preview {
    //CustomTextField()
    LoginScreen()
}
