//
//  LoginRepositoryImpl.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class AuthenticationRepositoryImpl: AuthenticationRepository {
    
    var loginDelegate: LoginComplateDelegate?
    
    func login(mailAddress: String, password: String) {
        
        FIRAuth.auth()?.signInWithEmail(mailAddress, password: password) {[weak self] (user, error) in
            
            if let error = error {
                self?.loginDelegate?.failure(error)
                return
            }
            
            if let user = user {
                self?.loginDelegate?.success(user.uid)
            }
        }
    }
    
    func uid() -> String {
        return FIRAuth.auth()?.currentUser?.uid ?? ""
    }
}
