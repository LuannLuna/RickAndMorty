//
//  Seeds.swift
//  RickAndMortyTests
//
//  Created by Luann Marques Luna on 17/04/24.
//

@testable import RickAndMorty

enum Seeds {
    static let rick = CharacterInfo(
        id: "1",
        name: "Rick",
        status: "Alive",
        type: "Human",
        gender: "Male",
        image: ""
    )
    
    static let morty = CharacterInfo(
        id: "2",
        name: "Morty",
        status: "Alive",
        type: "Human",
        gender: "Male",
        image: ""
    )
    
    static let characterDetailJson = """
    {
      "data": {
        "character": {
          "__typename": "Character",
          "id": "2",
          "name": "Morty Smith",
          "status": "Alive",
          "type": "",
          "gender": "Male",
          "origin": {
            "__typename": "Location",
            "name": "unknown",
            "dimension": null
          },
          "location": {
            "__typename": "Location",
            "name": "Citadel of Ricks"
          },
          "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
          "episode": [
            {
              "__typename": "Episode",
              "episode": "S01E01"
            },
            {
              "__typename": "Episode",
              "episode": "S01E02"
            }
          ]
        }
      }
    }
    """
}
