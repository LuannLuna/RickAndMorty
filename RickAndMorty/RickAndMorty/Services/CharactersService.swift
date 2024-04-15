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

final class CharactersService {
    private var apollo: ApolloClientProtocol
    private var pagingState: PagingState = .idle
    
    init(apollo: ApolloClientProtocol = ApolloClient(url: Constants.baseUrl)) {
        self.apollo = apollo
    }
    
    func fetchAllCharacters(_ nextPage: Int? = nil, completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
        
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
                completion(.failure(error))
            }
        }
    }
    
    func fetchCharacterDetail(id: String, completion: @escaping (Result<CharacterDetail?, Error>) -> Void) {
        apollo.fetch(
            query: FetchCharacterQuery(id: id),
            cachePolicy: .returnCacheDataAndFetch,
            contextIdentifier: nil,
            queue: .global()
        ) { result in
            switch result {
            case let .success(graphqlResponse):
                let character = graphqlResponse.data?.character
                completion(.success(character))
            case let .failure(error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
