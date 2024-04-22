//
//  RickAndMortyUITests.swift
//  RickAndMortyUITests
//
//  Created by Luann Marques Luna on 11/04/24.
//

import XCTest

final class RickAndMortyUITests: RIckAndMortyBase {
    func test_allElements_shouldExist() {
        XCTAssertTrue(app.searchFields["Search"].exists)
        XCTAssertTrue(app.navigationBars["Rick and Morty"].exists)
    }
    
    func test_search_shouldShouldShowResult() {
        app.searchFields["Search"].tap()
        
        app.typeText("Rick")
        XCTAssertTrue(app.buttons["result-search-item"].exists)
    }
    
    func test_navigationLink_shouldTransitToDetail() {
        app.buttons.firstMatch.tap()
        
        XCTAssertTrue(app.scrollViews["detail-character-view"].exists)
        
    }
    
    func test_navigaationLink_shouldTransitToEpisodeDetail() {
        app.buttons.firstMatch.tap()
        app.buttons["episode-item"].firstMatch.tap()
        XCTAssertTrue(app.scrollViews["episode-detail-view"].exists)
    }
}
