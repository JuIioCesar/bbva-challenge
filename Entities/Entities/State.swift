//
//  Model.swift
//  Entities
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

struct State {
    let id: Int
    let country: String
    let name: String
    let abbr: String
    let area: String
    let largestCity: String
    let capital: String
}

extension State {
    private struct Keys {
        static let id = "id"
        static let country = "country"
        static let name = "name"
        static let abbr = "abbr"
        static let area = "area"
        static let largest_city = "largest_city"
        static let capital = "capital"
    }
    
    init?(JSON: AnyObject) {
        guard let id = JSON[Keys.id] as? Int,
            let country = JSON[Keys.country] as? String,
            let name = JSON[Keys.name] as? String,
            let abbr = JSON[Keys.abbr] as? String,
            let area = JSON[Keys.area] as? String,
            let largest_city = JSON[Keys.largest_city] as? String,
            let capital = JSON[Keys.capital] as? String else {
                return nil
        }
        
        self.id = id
        self.country = country
        self.name = name
        self.abbr = abrr
        self.area = area
        self.largest_city = largest_city
        self.capital = capital
    }
}
