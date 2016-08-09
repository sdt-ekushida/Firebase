//
//  ToDoListPresenter.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

enum ToDoStatus {
    case Loading
    case Done
    case Error
}

protocol ToDoListLoadComplateDelegate {
    func success(todoItems: [ToDo])
    func failure(error: NSError)
}

class ToDoListPresenter: NSObject {
    
    let repository = ToDoRepositoryImpl()
    var viewInput: ToDoListViewInput?
    var uid = ""
    
    //MARK:- Public Method
    func viewDidLoad(viewController: ToDoListViewController, uid: String) {
        viewController.tableView.dataSource = viewController
        viewController.tableView.delegate = viewController
        viewInput = viewController
        repository.todoListDelegate = self
        self.uid = uid
    }
    
    func viewWillAppear() {
        todoList()
    }
    
    func configureCell(cell: UITableViewCell, todo: ToDo) {
        cell.textLabel?.text = todo.title
        
        guard todo.isDone else{
            return
        }
        let attributeText = NSMutableAttributedString(string: todo.title)
        
        attributeText.addAttribute(NSStrikethroughStyleAttributeName,
                                   value: NSUnderlineStyle.StyleSingle.rawValue,
                                   range: NSMakeRange(0, todo.title.characters.count))
        
        cell.textLabel?.attributedText = attributeText
    }
    
    func configureIndicator(indicator: UIActivityIndicatorView, status: ToDoStatus) {
        
        switch status {
        case .Loading:
            indicator.hidden = false
            indicator.startAnimating()
            
        default:
            indicator.hidden = true
            indicator.stopAnimating()
        }
    }
    
    func didTapDone(indexPath: NSIndexPath, todo: ToDo) {
        
        let mutableToDo = ToDo(key: todo.key, title: todo.title, isDone: todo.isDone ? false : true)
        ToDoUsecase(repository: repository).update(uid, todo: mutableToDo)
        todoList()
    }
    
    func todoAddViewController() -> ToDoAddViewController?{
        return UIStoryboard.getViewController("ToDoAdd", identifier: "ToDoAddViewController") ?? nil
    }
    
    //MARK:- Private Method
    private func todoList() {
        viewInput?.setStatus(.Loading)
        ToDoUsecase(repository: repository).findAll(uid)
    }
}

extension ToDoListPresenter: ToDoListLoadComplateDelegate {
    
    func success(todoItems: [ToDo]) {
        viewInput?.setStatus(.Done)
        viewInput?.success(todoItems)
    }
    
    func failure(error: NSError) {
        viewInput?.setStatus(.Error)
        viewInput?.failure(error)
    }
}