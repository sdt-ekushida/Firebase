//
//  LoginUsecase.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

class AuthenticationUsecase {
    
    var repository: AuthenticationRepository?
    
    convenience init(repository: AuthenticationRepository) {
        self.init()
        self.repository = repository
    }
    
    func login(mailAddress: String, password: String) {
        repository?.login(mailAddress, password: password)
    }
    
    func uid() -> String {
        return repository?.uid() ?? ""
    }
}
