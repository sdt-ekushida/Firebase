//
//  ToDoAddViewControlle.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

class ToDoAddViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    let presener = ToDoAddPresenter()
    var uid = ""
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Actions
    @IBAction func didTapAddTodo(sender: UIButton) {
        
        if let title = titleTextField.text where !title.isEmpty {
            presener.addTodo(uid, todo: ToDo(title: title, isDone: false))
            self.navigationController?.popViewControllerAnimated(true)
            return
        }
        
        //TODO: バリデーションチェック
    }
}
