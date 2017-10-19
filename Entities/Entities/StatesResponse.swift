//
//  StatesResponse.swift
//  Entities
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import Foundation

public struct StatesResponse {
    let messages: [String]
    let states: [State]
}

public extension StatesResponse {
    private struct Keys {
        static let RestResponse = "RestResponse"
        static let messages = "messages"
        static let result = "result"
    }
    
    init?(JSON: AnyObject) {
        guard let response = JSON[Keys.RestResponse] as? [String: Any],
              let messages = response[Keys.messages] as? [String],
              let result = JSON[Keys.result] as? [String: Any] else {
                return nil
        }
        self.states = result.flatMap({ (json) -> State? in
            return State(JSON: json as AnyObject)
        })
        self.messages = messages
    }
}
