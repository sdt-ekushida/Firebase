//
//  ViewController.swift
//  authentication
//
//  Created by Kushida　Eiji on 2016/07/30.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func createUser(email: String, password: String) {
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password) { (user, error) in
            // ...
            
            if let error = error {
                
                //TODO : エラーハンドリング
                print(error.code)
                
                // 17007 : 登録済みのメール
                // 17008 : メールの書式が間違っている
                // 17026 : パスワードが短い(6文字以上）
                // 17999 : メールまたは、パスワードが不正（空文字を指定した場合）
                
                return
            }
            
            if let user = user {
                print(user.uid)
                print(user.email)
            }
        }
    }
    
    private func login(email: String, password: String) {
        FIRAuth.auth()?.signInWithEmail(email, password: password) { (user, error) in
            
            if let error = error {
                
                //TODO : エラーハンドリング
                print(error.code)
                
                // 17009: パスワードが間違っている
                // 17011: ユーザが存在しない
                
                return
            }
            
            if let user = user {
                print(user.uid)
            }
        }
    }
    
    private func logout() {
        do{
            try FIRAuth.auth()?.signOut()
        }catch let error as NSError{
            print(error)
        }
    }
}

