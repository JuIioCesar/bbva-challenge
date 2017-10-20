//
//  ViewController.swift
//  Demo
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import UIKit

protocol TableViewCompatible {
    var reuseIdentifier: String { get }
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
}

protocol Configurable {
    associatedtype T
    var model: T? { get set }
    func configureWithModel(_: T)
}

class DataSource: NSObject, UITableViewDataSource {
    var data = [MyModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = data[indexPath.row]
        return model.cellForTableView(tableView: tableView, atIndexPath: indexPath)
    }
}

class MyModel: TableViewCompatible {
    var reuseIdentifier: String {
        return "MyModelCellIdentifier"
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! MyModelCell
        cell.configureWithModel(self)
        return cell
    }
}

class MyModelCell: UITableViewCell, Configurable {
    @IBOutlet var titleLabel: UILabel!
    var model: MyModel?
    func configureWithModel(_ model: MyModel) {
        self.model = model
//        self.titleLabel.text = model.title
    }
}

