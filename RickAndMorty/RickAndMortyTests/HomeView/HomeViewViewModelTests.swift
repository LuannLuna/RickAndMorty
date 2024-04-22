//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Luann Marques Luna on 11/04/24.
//

import XCTest
@testable import RickAndMorty

final class HomeViewViewModelTests: XCTestCase {
    
    func test_fetchAllCharacters_whenFetchAllFunctionIsCalled_shouldReturnSuccessfully() {
        let (viewModel, mockService) = makeSUT()
        DispatchQueue.main.async {
            // Given
            let charactersResponse = CharactersResponse(
                characters: [Seeds.rick],
                nextPage: 2
            )
            mockService.stubbedFetchAllCharactersCompletionResult = .success(
                charactersResponse
            )
            
            // When
            viewModel.fetchAllCharacters()
            
            // Then
            XCTAssertEqual(
                viewModel.characters.count,
                1
            )
            XCTAssertEqual(
                viewModel.characters.first?.name,
                "Rick"
            )
        }
    }
    
    func test_loadMoreItemsIfNeeded_whenLoadMoreItemsExists_shouldReturnNewItemSuccessfully() {
        let (viewModel, mockService) = makeSUT()
        DispatchQueue.main.async {
            // Given
            let charter = Seeds.rick
            viewModel.characters.append(.init(character: charter))
            
            // When
            viewModel.loadMoreItemsIfNeed(
                currentChar: CharacterViewModel(
                    character: charter
                )
            )
            
            mockService.stubbedFetchAllCharactersCompletionResult = .success(
                CharactersResponse(
                    characters: [Seeds.morty],
                    nextPage: 2
                )
            )
            
            // Then
            XCTAssertEqual(viewModel.searchResult.count, 2)
        }
    }
    
    func test_findCharacters_whenInputSearchText_shouldReturnCharactersSuccessfully() async {
        let (viewModel, mockService) = makeSUT()
        // Given
        let searchResult: [SearchResult] = [
            SearchResult(
                id: Seeds.rick.id,
                name: Seeds.rick.name,
                image: Seeds.rick.image
            ),
            SearchResult(
                id: Seeds.morty.id,
                name: Seeds.morty.name,
                image: Seeds.morty.image
            )
        ]
        mockService.stubbedFindCharacterCompletionResult = .success(searchResult)
        
        Task {
            await MainActor.run {
                // When
                viewModel.searchText = "Rick"
                viewModel.findCharacters()
            }
            
            // Then
            XCTAssertEqual(viewModel.searchResult.count, 2)
            XCTAssertEqual(viewModel.searchResult.first?.name, "Rick")
        }
    }
}

extension HomeViewViewModelTests {
    private
    func makeSUT() -> (HomeViewViewModel, MockCharacterService) {
        let mockService = MockCharacterService()
        let viewModel = HomeViewViewModel(service: mockService)
        return (viewModel, mockService)
    }
}
