//
//  SplashScreenView.swift
//  BookHub
//
//  Created by mac on 2024-11-05.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        Image("BookHub")
            .resizable()
            .frame(width: 170.0, height: 30.0)
            .scaledToFit()
            
    }
}

#Preview {
    SplashScreenView()
}




