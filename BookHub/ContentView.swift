//
//  ContentView.swift
//  BookHub
//
//  Created by mac on 2024-11-04.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isUserCurrentlyLoggedOut: Bool = false
    
    var body: some View {
        NavigationView{
            if self.isUserCurrentlyLoggedOut{
                HomeView()
            }else{
                LoginRegisterView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
