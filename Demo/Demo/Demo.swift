//
//  ViewController.swift
//  Demo
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import UIKit

class Demo : UIViewController {
    @IBOutlet weak var table: UITableView?
    @IBOutlet weak var button: UIBarButtonItem?
    private var interactor: Interactor?
    
    override func viewDidLoad() {
        table?.setAutomaticRowHeight()
        guard let table = table, let url = URL.groupktStates, let button = button else {
            return
        }
        interactor = Interactor(url: url, table: table)
        button.target = interactor
        button.action = #selector(interactor?.fetchData)
        button.title = "Refresh".localized
    }    
}
