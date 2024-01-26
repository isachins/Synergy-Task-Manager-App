//
//  OnBoard.swift
//  Synergy
//
//  Created by Sachin Sharma on 26/01/24.
//

import SwiftUI

//for multi screen
struct WelcomeScreen: View {
    
    var onSignUp: () -> Void
    
    @State private var pageIndex = 0
    var pages: [Welcome] = Welcome.samplePages
    let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        NavigationStack {
            TabView(selection: $pageIndex) {
                ForEach(pages) { page in
                    VStack {
                        Spacer()
                        WelcomeImage(page: page)
                        Spacer()
                        if page == pages.last {
                            Button(action: {
                                onSignUp()
                            }, label: {
                                Text("Sign Up")
                                    .DefaultButtonFormatting()
                            })
                        } else {
                            
                        }
                        Spacer()
                    }
//                    .onAppear() {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//                            pageIncrement()
//                        }
//                    }
                    .tag(page.tag)
                    .padding(.horizontal)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
        }
        }
        
    }
    
    func pageIncrement() {
         pageIndex += 1
    }
}

struct WelcomeImage: View {
    
    var page: Welcome
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
            
            Text(page.name)
                .font(Font.custom("Poppins-Bold", size: 36))
                .multilineTextAlignment(.center)
            
            Text(page.description)
                .font(Font.custom("Poppins-Light", size: 20))
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}



//#Preview {
//    WelcomeView(onSignUp: () -> Void)
//}
