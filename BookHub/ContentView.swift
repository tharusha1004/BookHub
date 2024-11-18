//
//  ContentView.swift
//  BookHub
//
//  Created by mac on 2024-11-04.
//

import SwiftUI
import Firebase
 
struct ContentView: View {
     
    @State private var isUserCurrentlyLoggedOut: Bool = false
    @State private var isAuthenticated: Bool = false
     
    var body: some View {
        NavigationView {
            if self.isUserCurrentlyLoggedOut {
                HomeView()
            }
            else if isAuthenticated {
                HomeView()
            }
            else {
                LoginRegisterView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut, isAuthenticated: $isAuthenticated)
            }
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
