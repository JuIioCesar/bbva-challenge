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

class Demo : UIViewController {
    @IBOutlet weak var table: UITableView?
    private var dataSource = DataSource()
    override func viewDidLoad() {
        let state = State(JSON: ["id": 1, "country": "MX", "name": "DF", "abbr": "DF", "area": "gfd", "largest_city": "fds", "capital": "here"] as AnyObject)!
        dataSource.data = [state]
        let nib = CellComponent.Nibs.makeNib(name: .SomeNibName)
        table?.register(nib, forCellReuseIdentifier: state.reuseIdentifier)
        table?.dataSource = dataSource
        table?.reloadData()
    }
}



