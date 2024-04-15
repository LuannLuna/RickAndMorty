//
//  CharacterDetailFactory.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 12/04/24.
//

import Foundation

enum CharacterDetailFactory {
    static func make(character: CharacterViewModel) -> CharacterDetailView {
        let service = CharactersService()
        let viewModel = CharacterDetailViewViewModel(
            characterViewModel: character,
            service: service
        )
        return CharacterDetailView(
            viewModel: viewModel
        )
    }
}
