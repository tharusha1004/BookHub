//
//  LoginRegisterTest.swift
//  BookHubTests
//
//  Created by mac
//  on 2024-11-18.
//

import XCTest
import Testing
import FirebaseAuth

@testable import BookHub

final class LoginRegisterTest: XCTestCase {

    // TEST: Login Account with Email & Password
    
    @Test func testLoginUser() async throws {
        
        let email = "test@gmail.com"
        let password = "123456"
        
        
        Auth.auth().signIn(withEmail: email, password: password){ rs, err in
            
            if let err = err {
                    XCTFail("Login failed: \(err.localizedDescription)")
            }else{
                print("Login succeeded")
            }
        }
    }
    
    // TEST: Signup to Account
    
    @Test func testCreateUser() async throws {
        
        let fname = "Sugath"
        let lname = "Kumar"
        let email = "test@gmail.com"
        let password = "123456"
        
        
        Auth.auth().createUser(withEmail: email, password: password){ rs, err in
            if let err = err {
                XCTFail("Signup failed: \(err.localizedDescription)")
            }else{
                print("Create User succeeded")
            }
        }
    }
}

