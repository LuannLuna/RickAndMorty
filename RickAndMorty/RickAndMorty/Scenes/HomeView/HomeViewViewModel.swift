//
//  HomeViewViewModel.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 11/04/24.
//

import Foundation

final class HomeViewViewModel: ObservableObject {
    private let service: CharactersService
    
    @Published var characters: [CharacterViewModel] = []
    @Published var isFinished: Bool = false
    
    private var nextPage: Int?
    
    init(service: CharactersService) {
        self.service = service
    }
    
    func fetchAllCharacters() {
        service.fetchAllCharacters(nextPage) { [weak self] result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    
                    characters += response.characters.map(CharacterViewModel.init)
                    nextPage = response.nextPage
                    isFinished = nextPage == nil ? true : false
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
}
