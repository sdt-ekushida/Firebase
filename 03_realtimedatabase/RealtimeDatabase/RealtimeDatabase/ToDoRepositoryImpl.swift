//
//  ToDoRepositoryImpl.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class ToDoRepositoryImpl: ToDoRepository {
    
    var todoListDelegate: ToDoListLoadComplateDelegate?
    
    func add(userID: String, todo: ToDo) {
        
        let ref = FIRDatabase.database().reference()
        let key = ref.child("todolist").childByAutoId().key
        let childUpdates = ["/user-todolist/\(userID)/\(key)/": ["title": todo.title, "isDone" : todo.isDone]]
        ref.updateChildValues(childUpdates)
    }
    
    func update(userID: String, todo: ToDo) {
        let ref = FIRDatabase.database().reference()
        let childUpdates = ["/user-todolist/\(userID)/\(todo.key)/": ["title": todo.title, "isDone" : todo.isDone]]
        ref.updateChildValues(childUpdates)
    }
    
    func findAll(userID: String) {
        
        let ref = FIRDatabase.database().reference()
        ref.child("user-todolist").child(userID).observeSingleEventOfType(.Value, withBlock: {[weak self] (snapshot) in
            
            guard let delegate = self?.todoListDelegate else { return }
            
            var todoItems = [ToDo]()
            
            for item in snapshot.children {
                let child = item as! FIRDataSnapshot
                let dic = child.value as! NSDictionary
                
                todoItems.append(ToDo(key: child.key, title: dic["title"] as! String, isDone: dic["isDone"] as! Bool))
            }
            delegate.success(todoItems)
            
        }) {[weak self] (error) in
            
            guard let delegate = self?.todoListDelegate else { return }
            delegate.failure(error)
        }
    }
}
