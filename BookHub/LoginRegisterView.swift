//
//  LoginRegisterView.swift
//  BookHub
//
//  Created by mac on 2024-11-18.
//

import SwiftUI
import Firebase
import FirebaseAuth

import LocalAuthentication

struct LoginRegisterView: View {
    
    @State var isLoginMode = false
    @State var fname = ""
    @State var lname = ""
    @State var email = ""
    @State var password = ""
    
    @State private var shouldShowLoginAlert: Bool = false
    @State var StatusMessage = ""
    
    @Binding var isUserCurrentlyLoggedOut: Bool
    @Binding var isAuthenticated: Bool
    
    @State private var alertMessage = ""
    
    var body: some View {
        ScrollView{
            
            VStack{
                
                //Logo
                Text("BookHub")
                    .font(.system(size:40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 20)
                
                //Subheading
                Text("- User Authentication -")
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 20)
                
                
                Picker(selection: $isLoginMode, label: Text("Picker Here")){
                    Text("Login")
                        .tag(true)
                    Text("Create Account")
                        .tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 20)
                
                if !isLoginMode{
                    
                    Group{
                        TextField("First Name", text: $fname)
                        TextField("Last Name", text: $lname)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    
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
                }
                
                else{
                    
                    Group{
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    
                    HStack{
                        Spacer()
                        Button{
                            print("Forgot Password")
                        } label: {
                            Text("Forgot Password")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.bottom, 20)
                    
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
                        }
                        .background(Color.blue)
                    }
                    .cornerRadius(10)
                    .alert(isPresented: $shouldShowLoginAlert){
                        Alert(title: Text("Email / Password Incorrect"))
                    }
                    
                    // Sign-in with Google, Facebook, and Apple
                    VStack(spacing: 12) {
                        Button {
                            print("Sign in with Google")
                        }label: {
                            HStack {
                                Image(systemName: "globe")
                                    .font(.system(size: 20))
                                Text("Sign in with Google")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                        }
                        
                        Button{
                            print("Sign in with Apple")
                        }label: {
                            HStack {
                                Image(systemName: "applelogo")
                                    .font(.system(size: 20))
                                Text("Sign in with Apple")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    VStack(spacing: 18) {
                        Button {
                            authenticate()
                        }label: {
                            HStack {
                                Text("Face ID")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.top, 50)
                    
                }
                
                //Text(self.StatusMessage)
                    //.foregroundColor(Color.red)
                
            }.padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(Color.white.edgesIgnoringSafeArea(.all))

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
    
    private func handleAction() {
        createNewAccount()
    }
      
    private func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.StatusMessage = "Failed to create user: \(err)"
                return
            }
             
            print("Successfully created user: \(result?.user.uid ?? "")")
   
            self.StatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
             
            self.storeUserInformation()
        }
    }
     
    private func storeUserInformation() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userData = ["fname": self.fname, "lname": self.lname, "email": self.email, "profileImageUrl": "profileurl", "uid": uid]
        Firestore.firestore().collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.StatusMessage = "\(err)"
                    return
                }
  
                print("Success")
            }
    }
    
    private func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with Face ID") { success, error in
                if success {
                    print("Authentication successful")
                      DispatchQueue.main.async {
                         self.alertMessage = "Authentication successful"
                         self.isAuthenticated = true
                      }
                } else {
                    print("Authentication Failed")
                       DispatchQueue.main.async {
                          self.alertMessage = "Authentication Failed"
                       }
                }
            }
        }
        else{
            print("Your device does not support Face ID")
            DispatchQueue.main.async {
                self.alertMessage = "Your device does not support Face ID"
            }
        }
    }
}

struct LoginRegisterView_Previews: PreviewProvider{
    @State static var isUserCurrentlyLoggedOut = false
    @State static var isAuthenticated = false
    static var previews: some View{
        LoginRegisterView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut, isAuthenticated: $isAuthenticated)
    }
}

