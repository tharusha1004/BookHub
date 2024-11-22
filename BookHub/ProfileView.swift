//
//  ProfileView.swift
//  BookHub
//
//  Created by mac on 2024-11-22.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isUserCurrentlyLoggedOut = false
    @State private var isAuthenticated = false
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                        .cornerRadius(100)
                        .padding(20)
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 33))
                        .foregroundColor(.blue)
                        .offset(x: 50, y: -60)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                VStack{
                    Text("Hello, I'm Tharusha Perera")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: 35, y: -40)
                    
                    Text("Ranking: Top Reader")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .foregroundColor(.blue)
                        .offset(x: -65, y: -25)
                    
                    Text("80")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x:-115, y:15)
                    
                    Text("Following")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .offset(x:-100, y:25)
                        .foregroundColor(.gray)
                    
                    Text("30")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: -20, y:-38)
                    
                    Text("No. of Books Read")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .offset(x:30, y:-32)
                        .foregroundColor(.gray)
                    
                    Text("10")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x:145, y:-94)
                    
                    Text("My Books")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .offset(x:165, y:-87)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                VStack{
                    Text("Follow Me")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x:-10, y:0)
                    
                    Image(systemName: "link")
                        .offset(x:-50, y:18)
                    
                    Text("https://www.facebook.com/")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .offset(x:70, y:0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                HStack{
                    // Logout Button
                    NavigationLink(destination: LoginRegisterView(isUserCurrentlyLoggedOut:$isUserCurrentlyLoggedOut, isAuthenticated: $isAuthenticated)) {
                        Text("Logout")
                            .font(.headline)
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, 20)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
