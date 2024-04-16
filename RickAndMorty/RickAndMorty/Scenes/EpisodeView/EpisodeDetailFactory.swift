//
//  EpisodeDetailFactory.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 15/04/24.
//

import Foundation

enum EpisodeDetailFactory {
    static func make(episode: String) -> EpisodeDetailView {
        let service = ApolloService()
        let viewModel = EpisodeDetailViewModel(episode: episode, service: service)
        return EpisodeDetailView(viewModel: viewModel)
    }
}
