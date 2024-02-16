//
//  LoginAPI.swift
//  Graft
//
//  Created by Zach Eidenberger on 2/12/24.
//

import Foundation
import FirebaseAuth


class LoginAPI {
    
    func loginWithCredentials(email: String, password: String) -> UserModel {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print("There was an error authenticating with email \(email); \(error)")
            }else {
                print(authResult?.user)
            }
        }
        
        return UserModel()
    }
}
