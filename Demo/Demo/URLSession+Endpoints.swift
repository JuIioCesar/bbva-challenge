//
//  URLSession+Endpoints.swift
//  Demo
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation
import Entities

extension URL {
    static let groupktStates = URL(string: "http://services.groupkt.com/state/get/USA/all")
}

extension URLSession {
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
