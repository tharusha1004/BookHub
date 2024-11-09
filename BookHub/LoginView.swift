// Author:  Tharusha Perera
// Date:    2024.11.08 | 09.17PM
// Page:    Login

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            Text("Login Page")
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
    }
}

#Preview {
    LoginView()
}
