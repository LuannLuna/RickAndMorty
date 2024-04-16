//
//  HomeViewViewModel.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 11/04/24.
//

import Foundation

final class HomeViewViewModel: ObservableObject {
    private let service: CharacterServiceProtocol
    
    @Published var characters: [CharacterViewModel] = []
    @Published var searchText: String = ""
    @Published var searchResult: [SearchResult] = []
    
    private var nextPage: Int?
    
    init(service: CharacterServiceProtocol) {
        self.service = service
    }
    
    func fetchAllCharacters() {
        service.fetchAllCharacters(nextPage) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    characters += response.characters.map(CharacterViewModel.init)
                    nextPage = response.nextPage
                }
            case let .failure(failure):
                print(failure)
            }
        }
    }
    
    func loadMoreItemsIfNeed(currentChar char: CharacterViewModel) {
        let thresholdIndex = characters.index(characters.endIndex, offsetBy: -5)
        if characters.firstIndex(where: { $0.id == char.id }) == thresholdIndex {
            fetchAllCharacters()
        }
    }
    
    func findCharacters() {
        service.findCharacter(name: searchText) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async { [weak self] in
                    self?.searchResult = response
                }
            case let .failure(failure):
                print(failure)
            }
        }
    }
}
