//
//  SplashScreenView.swift
//  Game of Thrones Chris
//
//  Created by Christopher Knight on 2023/02/10.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            if isActive {
                ContentView()
            }
            else {
                VStack {
                    VStack {
                        Image("Background").resizable()
                            .frame(width: 390, height: 500)
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .padding(.top, -250.0)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2.5)) {
                            self.size = 1.0
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
