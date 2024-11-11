//
//  SignupView.swift
//  BookHub
//
//  Created by mac on 2024-11-11.
//

import SwiftUI

struct SignupView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    
    var body: some View {
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
                        
                        //Password Textfield
                        VStack(alignment: .leading){
                            Text("Password")
                                .font(.subheadline)
                            
                            SecureField("Password", text: $password, prompt: Text("Enter your password"))
                                .font(.subheadline)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                        //Re-Password Textfield
                        VStack(alignment: .leading){
                            Text("Confirm Password")
                                .font(.subheadline)
                            
                            SecureField("Password", text: $repassword, prompt: Text("Enter your password"))
                                .font(.subheadline)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 16){
                        
                        //Create Account Button
                        Button{
                            print("TODO: Create account")
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
                    
                    //Other Options
                    VStack(spacing: 8){
                        //Sign in with Apple Button
                        Button{
                            print("TODO: Signin with Apple")
                        } label: {
                            Label("Sign in with Apple", systemImage: "applelogo")
                                .frame(maxWidth: .infinity)
                                .font(.title3.bold())
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(14)
                    }
                    .padding()
                
                    //Face Authentication
                    Button{
                        print("TODO: Face Authentication")
                    } label: {
                        Text("Face Authnetication")
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
                
            }
            
            //.navigationTitle("Login")
        }
    }
}

#Preview {
    SignupView()
}
