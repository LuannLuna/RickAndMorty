//
//  MockCharacterService.swift
//  RickAndMortyTests
//
//  Created by Luann Marques Luna on 17/04/24.
//

import Foundation
@testable import RickAndMorty

class MockCharacterService: CharacterServiceProtocol  {
    var stubbedFetchAllCharactersCompletionResult: Result<CharactersResponse, ApolloResponseError>?
    var stubbedFetchCharacterDetailCompletionResult: Result<CharacterDetailViewModel?, ApolloResponseError>?
    var stubbedFindCharacterCompletionResult: Result<[SearchResult], ApolloResponseError>?

    func fetchAllCharacters(_ nextPage: Int?, completion: @escaping (Result<CharactersResponse, ApolloResponseError>) -> Void) {
        if let result = stubbedFetchAllCharactersCompletionResult {
            completion(result)
        }
    }

    func fetchCharacterDetail(id: String, completion: @escaping (Result<CharacterDetailViewModel?, ApolloResponseError>) -> Void) {
        if let result = stubbedFetchCharacterDetailCompletionResult {
            completion(result)
        }
    }

    func findCharacter(name: String, completion: @escaping (Result<[SearchResult], ApolloResponseError>) -> Void) {
        if let result = stubbedFindCharacterCompletionResult {
            completion(result)
        }
    }
}
