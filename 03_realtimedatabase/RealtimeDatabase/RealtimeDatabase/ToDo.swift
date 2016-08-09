//
//  ToDo.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import Foundation

struct ToDo {
    var key = ""
    var title = ""
    var isDone = false
    
    init(key: String = "", title: String, isDone: Bool) {
        self.key = key
        self.title = title
        self.isDone = isDone
    }
}
