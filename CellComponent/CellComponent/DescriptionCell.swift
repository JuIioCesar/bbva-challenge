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
    @IBOutlet var titleLabel: UILabel!
    var model: State?
    func configureWithModel(_ model: State) {
        self.model = model
        self.titleLabel.text = "\(model.id)"
    }
}
