// Author:  Tharusha Perera
// Date:    2024.11.08 | 09.17PM
// Page:    Login

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                //Background Color
                Color.white
                    .ignoresSafeArea(edges: .all)
                
                VStack{
                    Image("BookHub")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .border(Color.red)
                    
                    VStack{
                        TextField("Email", text:$email)
                            .font(.title)
                        SecureField("Password", text: $password)
                            .font(.title)
                    }
                    .padding()
                    .border(Color.green)
                    
                    VStack{
                        Button("Sign in"){
                            print("TODO: Sign in")
                        }
                        Button("Create an account"){
                            print("TODO: Create account")
                        }
                    }
                    .padding()
                    .border(Color.purple)
                    
                    Button("Forgot Password"){
                        print("TODO: Forgot Password")
                    }
                    .padding()
                    .border(Color.blue)
                }
                
                
            }
            
            .navigationTitle("Login")
        }
    }
}

#Preview {
    LoginView()
}
