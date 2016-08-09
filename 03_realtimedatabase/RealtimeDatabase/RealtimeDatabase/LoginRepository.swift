//
//  LoginRepository.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import Foundation

protocol AuthenticationRepository: class {
    func login(mailAddress: String, password: String)
    func uid() -> String
}

