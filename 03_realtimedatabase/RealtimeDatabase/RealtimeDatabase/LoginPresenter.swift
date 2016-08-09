//
//  LoginPresenter.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

protocol LoginComplateDelegate {
    func success(uid: String)
    func failure(error: NSError)
}

class LoginPresenter: NSObject {
    
    let repository = AuthenticationRepositoryImpl()
    var loginViewInput: ToDoLoginViewInput?
    var viewController: LoginViewController?
    
    func viewDidLoad(viewController: LoginViewController) {
        self.viewController = viewController
        loginViewInput = viewController
        repository.loginDelegate = self
        
        if uid() != "" {
            showToDoListViewController(uid())
        }
    }
    
    func login(mailAddress: String, password: String) {
        
        AuthenticationUsecase(repository: repository).login(mailAddress, password: password)
    }
    
    func showToDoListViewController(uid: String) {
        if let vc = todoListViewController(), let viewController = viewController {
            vc.uid = uid
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func uid() -> String {
        return AuthenticationUsecase(repository: repository).uid()
    }
    
    private func todoListViewController() -> ToDoListViewController?{
        return UIStoryboard.getViewController("ToDoList", identifier: "ToDoListViewController") ?? nil
    }
}

extension LoginPresenter: LoginComplateDelegate {
    
    func success(uid: String) {
        loginViewInput?.success(uid)
    }
    
    func failure(error: NSError) {
        loginViewInput?.failure(error)
    }
}
