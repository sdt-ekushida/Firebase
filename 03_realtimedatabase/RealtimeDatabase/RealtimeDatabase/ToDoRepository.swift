//
//  ToDoRepository.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import Foundation

protocol ToDoRepository: class {
    func add(userID: String, todo: ToDo)
    func update(userID: String, todo: ToDo)
    func findAll(userID: String)
}
