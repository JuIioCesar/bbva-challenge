//
//  ViewController.swift
//  Demo
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import UIKit
import Entities
import CellComponent
import TableComponent
//TABLEVIEW

extension State: TableViewCompatible {
    var reuseIdentifier: String {
        return "MyModelCellIdentifier"
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! DescriptionCell
        cell.configureWithModel(self)
        return cell
    }
}



