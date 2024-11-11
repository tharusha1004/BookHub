// Author:  Tharusha Perera
// Date:    2024.11.08 | 09.17PM
// Page:    Login

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var showSignupView: Bool = false
    @State var showForgotPasswordView: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                
                //Links to the Signup view
                NavigationLink(destination: SignupView(), isActive: $showSignupView, label: { EmptyView() })
                
                //Links to the Reset Password view
                NavigationLink(destination: ForgotPasswordView(), isActive: $showForgotPasswordView, label: { EmptyView() })
                
                //Background Color
                Color.white
                    .ignoresSafeArea(edges: .all)
                
                //Logo
                VStack{
                    Image("BookHub")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    //Login Text
                    Text("Login")
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
                        
                        //Forgot Password Button
                        Button{
                            //print("TODO: Forgot Password")
                            self.showForgotPasswordView = true
                        } label: {
                            Text("Forgot Password")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 16){
                        //Signin Button
                        Button{
                            print("email:\(email)")
                            print("password:\(password)")
                        } label: {
                            Text("Sign in")
                                .frame(maxWidth: .infinity)
                                .font(.title3.bold())
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(14)
                        
                        //Create Account Button
                        Button{
                            //print("TODO: Create account")
                            self.showSignupView = true
                        } label: {
                            Text("Create Account")
                                .frame(maxWidth: .infinity)
                                .font(.title3.bold())
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray)
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
                        Text("Face Authentication")
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
    LoginView()
}
