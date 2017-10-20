//
//  Interactor.swift
//  Demo
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation
import UIKit
import CellComponent
import TableComponent
import Entities

enum TableData {
    fileprivate static var source = DataSource()
}

class Interactor {
    
    private let url: URL
    private let table: UITableView
    
    init(url: URL, table: UITableView) {
        self.url = url
        self.table = table
    }
    
    @objc func fetchData() {
        let task = URLSession.shared.statesTask(with: url) { (states) in
            DispatchQueue.main.async {
                
                if let state = states.first  {
                    let nib = CellComponent.NibClass.makeNib(name: .DescriptionCell)
                    self.table.register(nib, forCellReuseIdentifier:state.reuseIdentifier)
                }
                
                TableData.source.data = states
                self.table.dataSource = TableData.source
                self.table.reloadData()
                
            }
        }
        task.resume()
    }
}
