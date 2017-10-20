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

extension URLSession {
    
    enum Endpoints: String {
        case production = "http://services.groupkt.com/state/get/USA/all"
    }
    
    func statesTask(with url: URL, completion: @escaping ([State]) -> ()) -> URLSessionDataTask {
        let task = dataTask(with: url) { (data, response, error) in
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let statesResponse = StatesResponse(JSON: json as AnyObject) else {
                    completion([])
                    return
            }
            completion(statesResponse.states)
        }
        return task
    }
    
}

class Demo : UIViewController {
    @IBOutlet weak var table: UITableView?
    private var dataSource = DataSource()
    override func viewDidLoad() {
        guard let table = self.table else {
            return
        }
        table.setAutomaticRowHeight()
        
        guard let url = URL(string: URLSession.Endpoints.production.rawValue) else {
            return
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        let task = URLSession.shared.statesTask(with: url) { (states) in
                        DispatchQueue.main.async {
                            self.dataSource.data = states
                            if let state = states.first  {
                                let nib = CellComponent.NibClass.makeNib(name: .DescriptionCell)
                                table.register(nib, forCellReuseIdentifier:state.reuseIdentifier)
                            }
                            table.dataSource = self.dataSource
                            table.reloadData()
                            
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }
        }
        task.resume()
    }
    
}



