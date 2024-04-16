//
//  CharacterDetailFactory.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 12/04/24.
//

import Foundation
import Apollo

enum CharacterDetailFactory {
    static func make(characterID: GraphQLID) -> CharacterDetailView {
        let service = ApolloService()
        let viewModel = CharacterDetailViewViewModel(characterID: characterID, service: service)
        return CharacterDetailView(
            viewModel: viewModel
        )
    }
}
