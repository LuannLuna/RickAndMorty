//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 15/04/24.
//

import Foundation

final class EpisodeDetailViewModel: ObservableObject {
    private let episode: String
    private let service: EpisodeServiceProtocol
    @Published var episodeViewModel: EpisodeViewModel?
    
    init(episode: String, service: EpisodeServiceProtocol) {
        self.episode = episode
        self.service = service
    }
    
    func fetchEpisodeDetail() {
        service.fetchEpisodeDetail(episode: episode) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async { [weak self] in
                    guard let response else { return }
                    self?.episodeViewModel = .init(episode: response)
                }
            case let .failure(failure):
                print(failure)
            }
        }
    }
}
