//
//  RIckAndMortyBase.swift
//  RickAndMortyUITests
//
//  Created by Luann Marques Luna on 18/04/24.
//

import XCTest

class RIckAndMortyBase: XCTestCase {
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
}
