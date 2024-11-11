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
        
        NavigationView{
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
                    Text("Create an Account")
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
                            Text("Create Account")
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
                    
                    //Login
                    Button{
                        print("TODO: Back to login")
                    } label: {
                        Text("Already have an account? Signin")
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
                
            }
            
            //.navigationTitle("Forgot Password")
        }
    }
}

#Preview {
    ForgotPasswordView()
}
