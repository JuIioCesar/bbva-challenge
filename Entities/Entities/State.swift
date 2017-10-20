//
//  Model.swift
//  Entities
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

public struct State {
    public let id: Int
    public let country: String
    public let name: String
    public let abbr: String
    public let area: String
    public let largestCity: String
    public let capital: String
}

public extension State {
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
        self.abbr = abbr
        self.area = area
        self.largestCity = largest_city
        self.capital = capital
    }
}

extension State: CustomStringConvertible {
    public var description: String {
        return "id: \(self.id)" + "\n" +
               "country: \(self.country)" + "\n" +
               "name: \(self.name)" + "\n" +
               "abbr: \(self.abbr)" + "\n" +
               "area: \(self.area)" + "\n" +
               "largestCity: \(self.largestCity)" + "\n" +
               "capital: \(self.capital)"
    }
}
