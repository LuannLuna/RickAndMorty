//
//  CharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 12/04/24.
//

import Foundation
import Apollo

final class CharacterDetailViewViewModel: ObservableObject {
    private var characterID: GraphQLID
    private let service: CharacterServiceProtocol
    @Published var character: CharacterDetailViewModel?

    init(characterID: GraphQLID, service: CharacterServiceProtocol) {
        self.characterID = characterID
        self.service = service
    }
    
    func fetchDetail() {
        service.fetchCharacterDetail(id: characterID) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async { [weak self] in
                    guard let response else { return }
                    self?.character = response
                }
            case let .failure(failure):
                print(failure)
            }
        }
    }
}
