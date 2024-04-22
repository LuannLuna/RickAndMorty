//
//  Client.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 11/04/24.
//

import Apollo
import Foundation

enum Constants {
    static let baseUrl: URL = URL(string: "https://rickandmortyapi.com/graphql")!
}

typealias CharacterDetail = FetchCharacterQuery.Data.Character

struct CharactersResponse {
    let characters: [CharacterInfo]
    let nextPage: Int?
}

enum PagingState: Equatable {
    case idle
    case loadingFirstPage
    case loadingNextPage
}

protocol CharacterServiceProtocol {
    func fetchAllCharacters(_ nextPage: Int?, completion: @escaping (Result<CharactersResponse, ApolloResponseError>) -> Void)
    func fetchCharacterDetail(id: String, completion: @escaping (Result<CharacterDetailViewModel?, ApolloResponseError>) -> Void)
    func findCharacter(name: String, completion: @escaping (Result<[SearchResult], ApolloResponseError>) -> Void)
}

extension CharacterServiceProtocol {
    func fetchAllCharacters(completion: @escaping (Result<CharactersResponse, ApolloResponseError>) -> Void) {
        fetchAllCharacters(nil, completion: completion)
    }
}

protocol EpisodeServiceProtocol {
    func fetchEpisodeDetail(episode: String, completion: @escaping (Result<EpisodeInfo?, ApolloResponseError>) -> Void)
}

enum ApolloResponseError: Error {
    case notData
    case generic(Error)
}

final class ApolloService {
    private var apollo: ApolloClientProtocol
    private var pagingState: PagingState = .idle
    
    init(apollo: ApolloClientProtocol = ApolloClient(url: Constants.baseUrl)) {
        self.apollo = apollo
    }
}

extension ApolloService: CharacterServiceProtocol {
    func fetchAllCharacters(_ nextPage: Int?, completion: @escaping (Result<CharactersResponse, ApolloResponseError>) -> Void) {
        
        if pagingState == .loadingFirstPage || pagingState == .loadingNextPage {
            return
        }
        pagingState = nextPage == nil ? .loadingNextPage : .loadingNextPage
        apollo.fetch(
            query: FetchAllCharactersQuery(page: nextPage ?? 1),
            cachePolicy: .returnCacheDataAndFetch,
            contextIdentifier: nil,
            queue: .global())
        { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(graphqlResponse):
                let nextPage = graphqlResponse.data?.characters?.info?.fragments.pageInfo.next
                let characters: [CharacterInfo] = graphqlResponse.data?.characters?.results?.compactMap {
                    $0?.fragments.characterInfo
                } ?? []
                let response = CharactersResponse(characters: characters, nextPage: nextPage)
                pagingState = .idle
                completion(.success(response))
            case let .failure(error):
                print(error.localizedDescription)
                completion(.failure(.generic(error)))
            }
        }
    }
    
    func findCharacter(name: String, completion: @escaping (Result<[SearchResult], ApolloResponseError>) -> Void) {
        apollo.fetch(
            query: FindCharacterQuery(
                filter: FilterCharacter(
                    name: name
                )
            ),
            cachePolicy: .returnCacheDataAndFetch,
            contextIdentifier: nil,
            queue: .global()
        ) { result in
            switch result {
            case let .success(graphqlResponse):
                let chars = graphqlResponse.data?.characters?.results?.compactMap { $0 }
                let result: [SearchResult] = chars?.compactMap {
                    let char = $0.fragments.characterInfo
                    return SearchResult(id: char.id, name: char.name, image: char.image)
                } ?? []
                completion(.success(result))
            case let .failure(error):
                print(error.localizedDescription)
                completion(.failure(.generic(error)))
            }
        }
    }
    
    func fetchCharacterDetail(id: String, completion: @escaping (Result<CharacterDetailViewModel?, ApolloResponseError>) -> Void) {
        apollo.fetch(
            query: FetchCharacterQuery(id: id),
            cachePolicy: .returnCacheDataAndFetch,
            contextIdentifier: nil,
            queue: .global()
        ) { result in
            switch result {
            case let .success(graphqlResponse):
                guard let character = graphqlResponse.data?.character else {
                    return completion(.failure(.notData))
                }
                completion(.success(.init(characterDetail: character)))
            case let .failure(error):
                print(error.localizedDescription)
                completion(.failure(.generic(error)))
            }
        }
    }
}

extension ApolloService: EpisodeServiceProtocol {
    func fetchEpisodeDetail(episode: String, completion: @escaping (Result<EpisodeInfo?, ApolloResponseError>) -> Void) {
        apollo.fetch(
            query: FetchEpisodeQuery(
                filter: FilterEpisode(
                    episode: episode
                )
            ),
            cachePolicy: .returnCacheDataAndFetch,
            contextIdentifier: nil,
            queue: .global()
        ) { result in
            switch result {
            case let .success(graphqlResponse):
                let episodes: [EpisodeInfo] = graphqlResponse.data?.episodes?.results?.compactMap { $0?.fragments.episodeInfo } ?? []
                completion(.success(episodes.first))
            case let .failure(error):
                print(error)
                completion(.failure(.generic(error)))
            }
        }
    }
}

struct SearchResult: Identifiable, Hashable {
    let id: GraphQLID?
    let name: String?
    let image: String?
    
    var url: URL? {
        guard
            let urlString = image,
            let url = URL(string: urlString)
        else {
            return nil
        }
        return url
    }
}
