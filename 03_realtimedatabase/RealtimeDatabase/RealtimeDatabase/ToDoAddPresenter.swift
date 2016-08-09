//
//  ToDoAddPresenter.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

class ToDoAddPresenter: NSObject {
    
    let repository = ToDoRepositoryImpl()
    
    //MARK:- Public Method
    func addTodo(uid: String, todo: ToDo) {
        let usecase = ToDoUsecase(repository: repository)
        usecase.add(uid, todo: todo)
    }
}
