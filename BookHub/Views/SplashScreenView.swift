//
//  SplashScreenView.swift
//  BookHub
//
//  Created by mac on 2024-11-05.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            LoginView()
        }else{
            VStack{
                VStack{
                    Image(systemName: "book.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                    Text("BookHub")
                        .font(.system(size: 40))
                        .foregroundColor(.black.opacity(0.8))
                        .bold()
                        
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation (.easeIn(duration:1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                    
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews:PreviewProvider{
    static var previews: some View{
        SplashScreenView()
    }
}

