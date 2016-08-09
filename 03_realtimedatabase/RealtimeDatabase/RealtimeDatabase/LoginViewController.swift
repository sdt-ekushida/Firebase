//
//  LoginViewController.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

protocol ToDoLoginViewInput {
    func success(uid: String)
    func failure(error: NSError)
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let presener = LoginPresenter()
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presener.viewDidLoad(self)
    }
    
    //MARK:- Actions
    @IBAction func didTapLogin(sender: UIButton) {
        
        if let mailAddress = mailAddressTextField.text,
            let password = passwordTextField.text {
            presener.login(mailAddress, password: password)
            return
        }
        
        //TODO: エラー処理
    }
}

extension LoginViewController: ToDoLoginViewInput {
    
    func success(uid: String) {
        presener.showToDoListViewController(uid)
    }
    
    func failure(error: NSError) {
        
        //TODO: エラー処理
        print(error.localizedDescription)
    }
}
