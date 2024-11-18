//
//  LoginRegisterView.swift
//  BookHub
//
//  Created by mac on 2024-11-18.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginRegisterView: View {
    
    @State var isLoginMode = false
    @State var fname = ""
    @State var lname = ""
    @State var email = ""
    @State var password = ""
    
    @State private var shouldShowLoginAlert: Bool = false
    @State var StatusMessage = ""
    
    @Binding var isUserCurrentlyLoggedOut: Bool
    
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
                        handleAction()
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
                    
                    Group{
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Button{
                        loginUser()
                    } label: {
                        HStack{
                            Spacer()
                            Text("Login")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 18, weight: .semibold))
                            Spacer()
                        }.background(Color.green)
                    }.cornerRadius(10)
                        .alert(isPresented: $shouldShowLoginAlert){
                            Alert(title: Text("Email / Password Incorrect"))
                        }
                }
                
                Text(self.StatusMessage)
                    .foregroundColor(Color.white)
                
            }.padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(
            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .topLeading, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        )
    }
    
    private func loginUser(){
        Auth.auth().signIn(withEmail: email, password: password){ result, err in
            if let err = err{
                print("Failed to login", err)
                self.StatusMessage = "Failed to login user: \(err)"
                self.shouldShowLoginAlert = true
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            self.StatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            self.isUserCurrentlyLoggedOut = true
        }
    }
    
    private func handleAction(){
        createAccount()
    }
    
    private func createAccount(){
        Auth.auth().createUser(withEmail: email, password: password){ result, err in
            if let err = err{
                print("Failed to create user", err)
                self.StatusMessage = "Failed to create user: \(err)"
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
            self.StatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
            
            self.storeUserInformation()
        }
    }
    
    private func storeUserInformation(){
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let userData = ["fname": self.fname, "lname":self.lname, "email": self.email, "profileImageUrl": "profileurl", "uid": uid]
        Firestore.firestore().collection("users").document(uid).setData(userData){ err in
            if let err = err{
                print(err)
                self.StatusMessage = "\(err)"
                return
            }
            print("Success")
            
        }
    }
}

struct LoginRegisterView_Previews: PreviewProvider{
    @State static var isUserCurrentlyLoggedOut = false
    static var previews: some View{
        LoginRegisterView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
    }
}
