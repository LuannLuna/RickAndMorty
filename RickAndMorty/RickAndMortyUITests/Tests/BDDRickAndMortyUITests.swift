//
//  BDDRickAndMortyUITests.swift
//  RickAndMortyUITests
//
//  Created by Luann Marques Luna on 18/04/24.
//

import XCTest

final class BDDRickAndMortyUITests: RIckAndMortyBase {
    func test_whenSearch_shouldTransitToDetailScreen() {
        givenAppIsReady()
        whenIEnter(search: "Googah")
        whenITapFirstResult()
        thenIShouldSeeTheDetailScreen()
    }
}

extension BDDRickAndMortyUITests {
    
    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given App is ready ") { _ in
            XCTAssertTrue(RickAndMortyScreen.search.element.exists)
        }
        
    }
    
    func whenIEnter(search: String) {
        XCTContext.runActivity(named: "When I search \(search) ") { _ in
            RickAndMortyScreen.search.element.tap()
            app.typeText(search)
        }
    }
    
    func whenITapFirstResult() {
        XCTContext.runActivity(named: "When I Tap First Result ") { _ in
            RickAndMortyScreen.resultItem.element.buttons.firstMatch.tap()
        }
    }
    
    func thenIShouldSeeTheDetailScreen() {
        XCTContext.runActivity(named: "Then I Should See The Detail Screen ") { _ in
            XCTAssertTrue(RickAndMortyScreen.detailView.element.exists)
        }
    }
    
}

