//
//  ForgotPasswordView.swift
//  BookHub
//
//  Created by mac on 2024-11-12.
//

import SwiftUI

struct ForgotPasswordView: View {
    var body: some View {
        @State var email: String = ""
        
        @State var showLoginView: Bool = false
        
            ZStack{
                
                //Background Color
                Color.white
                    .ignoresSafeArea(edges: .all)
                
                //Logo
                VStack{
                    Image("BookHub")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    //Signup Text
                    Text("Forgot Password")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    VStack(spacing: 16){
                        //Email Textfield
                        VStack(alignment: .leading){
                            Text("Email")
                                .font(.subheadline)
                            
                            TextField("Email", text:$email, prompt: Text("Enter your email"))
                                .font(.subheadline)
                                .textFieldStyle(.roundedBorder)
                                .autocapitalization(.none)
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 16){
                        
                        //Create Account Button
                        Button{
                            print("email:\(email)")
                            
                        } label: {
                            Text("Reset Password")
                                .frame(maxWidth: .infinity)
                                .font(.title3.bold())
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(14)
                    }
                    .padding()
                    
                    Spacer()
                }
                
            }
            
            //.navigationTitle("Forgot Password")
    }
}

#Preview {
    ForgotPasswordView()
}
