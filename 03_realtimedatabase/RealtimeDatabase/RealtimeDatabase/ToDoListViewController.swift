//
//  ToDoListViewController.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

protocol ToDoListViewInput {
    func setStatus(status: ToDoStatus)
    func success(todoItems: [ToDo])
    func failure(error: NSError)
}

class ToDoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let presenter = ToDoListPresenter()
    var uid = ""
    var todoList = [ToDo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(self, uid: uid)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    //MARK:- Actions
    @IBAction func didTapAddTodo(sender: UIBarButtonItem) {
        
        if let vc = presenter.todoAddViewController() {
            vc.uid = uid
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ToDoListViewController: ToDoListViewInput {
    
    func setStatus(status: ToDoStatus) {
        presenter.configureIndicator(indicator, status: status)
    }
    
    func success(todoItems: [ToDo]) {
        todoList.removeAll()
        todoList = todoItems
    }
    
    func failure(error: NSError) {
        print(error.description)
    }
}

extension ToDoListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        presenter.configureCell(cell, todo: todoList[indexPath.row])
        return cell
    }
}

extension ToDoListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        presenter.didTapDone(indexPath, todo: todoList[indexPath.row])
    }
}
