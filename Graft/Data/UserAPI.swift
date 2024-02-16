//
//  UserAPI.swift
//  Graft
//
//  Created by Zach Eidenberger on 2/16/24.
//

import Foundation

class UserAPI {
    
    
    func createUser(id: String, username: String, password: String, firstName: String, lastName: String, birthday: String, address: String, phoneNumber: String, biography: String) -> UserModel? {
        var newUser: UserModel?
        guard let url = URL(string: "http://localhost:5432/users") else { return UserModel() }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error)
                newUser = nil
            }else {
                do {
                    if let data = data  {
                        if let user: UserModel = try JSONSerialization.jsonObject(with: data) as? UserModel {
                            print(user)
                            newUser = user
                        }
                    }
                }catch {
                    print(error)
                }
            }
        }
        task.resume()
        return newUser
    }
}
