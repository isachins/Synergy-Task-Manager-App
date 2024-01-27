//
//  viewModifiers.swift
//  Synergy
//
//  Created by Sachin Sharma on 26/01/24.
//

import SwiftUI


// Default Formatting for buttons
struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.fore)
            .font(Font.custom("Poppins-Medium", size: 20))
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
        
    }
}

extension View {
    
    func DefaultButtonFormatting(backgroundColor: Color = .back) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}


// Default Formatting for Text Feilds
struct DefaultTextFeildViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(backgroundColor)
            .cornerRadius(10)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
        
    }
}

extension View {
    
    func DefaultTextFeildFormatting(backgroundColor: Color = .black.opacity(0.05)) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}







struct viewModifiers: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Hello, World!")
//                .modifier(DefaultButtonViewModifier(backgroundColor: .green))
//                .font(.headline)
//            
//            // or this way with view extension
//            Text("Hello, World!")
//                .DefaultButtonFormatting(backgroundColor: .orange)
//                .font(.title)
//            
//            Text("Hello, World!")
//                .DefaultButtonFormatting()
//                .font(.title)
        }
        .padding()
    }
}


#Preview {
    viewModifiers()
}
