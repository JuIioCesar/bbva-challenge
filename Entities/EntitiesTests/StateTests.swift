//
//  EntitiesTests.swift
//  EntitiesTests
//
//  Created by Julio Cesar Guzman Villanueva on 10/19/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import XCTest
@testable import Entities

private extension JSONSerialization {
    static func makeJSONDictionary(from bundle: Bundle, with name: String) -> [String: Any]? {
        guard let JSONStateFile = bundle.path(forResource: name, ofType: "json"),
            let jsonString = try? String(contentsOfFile: JSONStateFile),
            let data = jsonString.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: data) else {
                XCTFail("JSON Initializing failed")
                return nil
        }
        return json as? [String: Any]
    }
}

class StateTests: XCTestCase {
    
    func testStateJSONInitializer() {
        let jsonFileName = "State"
        let bundle = Bundle(for: type(of: self))
        let jsonDictionary = JSONSerialization.makeJSONDictionary(from: bundle, with: jsonFileName)
        let parsedObject = jsonDictionary as AnyObject
        if let state = State(JSON: parsedObject) {
            test(state)
        }
        
    }
    
    func testStateReponseJSONInitializer() {
        let jsonFileName = "StateResponse"
        let bundle = Bundle(for: type(of: self))
        let jsonDictionary =  JSONSerialization.makeJSONDictionary(from: bundle, with: jsonFileName)
        let parsedObject = jsonDictionary as AnyObject
        if let statesResponse = StatesResponse(JSON: parsedObject),
           let state = statesResponse.states.first {
            test(state)
        }
    }
    
    func test(_ state: State) {
        XCTAssert(state.id == 1, "State identifier initialization failed at identifier parsing")
        XCTAssert(state.country == "USA", "State identifier initialization failed at country parsing")
        XCTAssert(state.name == "Alabama", "State identifier initialization failed at name parsing")
        XCTAssert(state.abbr == "AL", "State identifier initialization failed at abbreviature parsing")
        XCTAssert(state.area == "135767SKM", "State identifier initialization failed at area parsing")
        XCTAssert(state.largestCity == "Birmingham", "State identifier initialization failed at largest city parsing")
        XCTAssert(state.capital == "Montgomery", "State identifier initialization failed at capital parsing")
    }
}
