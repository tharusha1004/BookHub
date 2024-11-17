//
//  LoginRegisterView.swift
//  BookHub
//
//  Created by mac on 2024-11-18.
//

import SwiftUI

struct LoginRegisterView: View {
    
    @State var isLoginMode = false
    @State var fname = ""
    @State var lname = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ScrollView{
            
            VStack(spacing: 16){
                Picker(selection: $isLoginMode, label: Text("Picker Here")){
                    Text("Login")
                        .tag(true)
                    Text("Create Account")
                        .tag(false)
                }.pickerStyle(SegmentedPickerStyle())
                
                if !isLoginMode{
                    //Text("Register")
                    VStack{
                        Image(systemName: "person.fill")
                            .font(.system(size:32))
                            .padding()
                            .foregroundColor(Color(.label))
                    }
                    .overlay(RoundedRectangle(cornerRadius: 32).stroke(Color.black, lineWidth: 3))
                    
                    Group{
                        TextField("First Name", text: $fname)
                        TextField("Last Name", text: $lname)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Button{
                        
                    }label: {
                        HStack{
                            Spacer()
                            Text("Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 18, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                    }.cornerRadius(10)
                }else{
                    Image("Login")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 128, height: 128)
                        .cornerRadius(64)
                }
            }.padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(
            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .topLeading, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        )
    }
}

struct LoginRegisterView_Previews: PreviewProvider{
    static var previews: some View{
        LoginRegisterView()
    }
}
