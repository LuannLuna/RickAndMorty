//
//  CharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 12/04/24.
//

import Foundation

final class CharacterDetailViewViewModel: ObservableObject {
    private var characterViewModel: CharacterViewModel
    private let service: CharactersService
    @Published var character: CharacterDetailViewModel?

    init(characterViewModel: CharacterViewModel, service: CharactersService) {
        self.characterViewModel = characterViewModel
        self.service = service
    }
    
    func fetchDetail() {
        service.fetchCharacterDetail(id: characterViewModel.id) { [weak self] result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async { [weak self] in
                    guard let response else { return }
                    self?.character = .init(characterDetail: response)
                }
            case let .failure(failure):
                print(failure)
            }
        }
    }
}
