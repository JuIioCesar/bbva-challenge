//
//  EntitiesTests.swift
//  EntitiesTests
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import XCTest
@testable import Entities

class StateTests: XCTestCase {
    
    func testStateJSONInitializer() {
        let jsonFileName = "State"
        guard let JSONStateFile = Bundle(for: type(of: self)).path(forResource: jsonFileName, ofType: "json"),
              let jsonString = try? String(contentsOfFile: JSONStateFile),
              let data = jsonString.data(using: .utf8),
              let json = try? JSONSerialization.jsonObject(with: data) else {
              XCTFail("JSON Initializing failed")
              return
        }
        
        let parsedObject = json as AnyObject
        if let state = State(JSON: parsedObject) {
            XCTAssert(state.id == 1, "State identifier initialization failed at identifier parsing")
            XCTAssert(state.country == "USA", "State identifier initialization failed at country parsing")
            XCTAssert(state.name == "Alabama", "State identifier initialization failed at name parsing")
            XCTAssert(state.abbr == "AL", "State identifier initialization failed at abbreviature parsing")
            XCTAssert(state.area == "135767SKM", "State identifier initialization failed at area parsing")
            XCTAssert(state.largestCity == "Birmingham", "State identifier initialization failed at largest city parsing")
            XCTAssert(state.capital == "Montgomery", "State identifier initialization failed at capital parsing")
        }
        
    }
    
    func testStateReponseJSONInitializer() {
        let jsonFileName = "StateResponse"
        guard let JSONStateFile = Bundle(for: type(of: self)).path(forResource: jsonFileName, ofType: "json"),
            let jsonString = try? String(contentsOfFile: JSONStateFile),
            let data = jsonString.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: data) else {
                XCTFail("JSON Initializing failed")
                return
        }
        
        let parsedObject = json as AnyObject
        if let statesResponse = StatesResponse(JSON: parsedObject),
           let state = statesResponse.states.first {
            XCTAssert(state.id == 1, "State identifier initialization failed at identifier parsing")
            XCTAssert(state.country == "USA", "State identifier initialization failed at country parsing")
            XCTAssert(state.name == "Alabama", "State identifier initialization failed at name parsing")
            XCTAssert(state.abbr == "AL", "State identifier initialization failed at abbreviature parsing")
            XCTAssert(state.area == "135767SKM", "State identifier initialization failed at area parsing")
            XCTAssert(state.largestCity == "Birmingham", "State identifier initialization failed at largest city parsing")
            XCTAssert(state.capital == "Montgomery", "State identifier initialization failed at capital parsing")
        }
    }
    
//    func json(name: String) -> [String: Any] {
//        
//    }
}
