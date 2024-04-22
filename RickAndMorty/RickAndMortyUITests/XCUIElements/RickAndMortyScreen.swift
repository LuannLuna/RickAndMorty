//
//  RickAndMortyScreen.swift
//  RickAndMortyUITests
//
//  Created by Luann Marques Luna on 18/04/24.
//

import XCTest

enum RickAndMortyScreen: String {
    case search = "Search"
    case navigationBar = "Rick and Morty"
    case resultItem = "result-search-item"
    case detailView = "detail-character-view"
    case episodeView = "episode-detail-view"
    
    var element: XCUIElement {
        switch self {
        case .search:
            XCUIApplication().searchFields[rawValue]
            
        case .navigationBar:
            XCUIApplication().navigationBars[rawValue]
            
        case .detailView, .episodeView:
            XCUIApplication().scrollViews[rawValue]
            
        case .resultItem:
            XCUIApplication().buttons[rawValue]
        }
    }
}
