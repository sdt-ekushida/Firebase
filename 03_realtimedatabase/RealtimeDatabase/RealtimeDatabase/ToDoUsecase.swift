//
//  ToDoUsecase.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import Foundation

class ToDoUsecase {
    
    var repository: ToDoRepository?
    
    convenience init(repository: ToDoRepository) {
        self.init()
        self.repository = repository
    }
        
    func add(userID: String, todo: ToDo) {
        repository?.add(userID, todo: todo)
    }
    
    func update(userID: String, todo: ToDo) {
        repository?.update(userID, todo: todo)
    }
    
    func findAll(userID: String) {
        repository?.findAll(userID)
    }
}
