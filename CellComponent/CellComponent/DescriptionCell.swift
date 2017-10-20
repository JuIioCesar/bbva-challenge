//
//  DescriptionCell.swift
//  CellComponent
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation
import TableComponent
import Entities

class DescriptionCell: UITableViewCell, TableComponent.Configurable {
    @IBOutlet var titleLabel: UILabel?
    var model: State?
    func configureWithModel(_ model: State) {
        self.model = model
        self.titleLabel?.text = "\(model)"
    }
}

public enum Nibs: String {
    case DescriptionCell
}

public class NibClass {
    public static func makeNib(name: Nibs) -> UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: name.rawValue, bundle: bundle)
    }
}

extension State: TableViewCompatible {
    public var reuseIdentifier: String {
        return Nibs.DescriptionCell.rawValue
    }
    
    public func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! DescriptionCell
        cell.configureWithModel(self)
        return cell
    }
}
