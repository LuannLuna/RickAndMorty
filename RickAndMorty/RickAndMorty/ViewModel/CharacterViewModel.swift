//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 11/04/24.
//

import Foundation

struct CharacterViewModel {
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var id: String {
        character.fragments.characterInfo.id?.debugDescription ?? UUID().uuidString
    }
    
    var imageUrl: URL? {
        guard
            let urlString = character.fragments.characterInfo.image,
            let url = URL(string: urlString)
        else {
            return nil
        }
        return url
    }
    
    var name: String {
        character.fragments.characterInfo.name ?? "--"
    }
    
    var origin: String {
        character.fragments.characterInfo.origin?.name ?? "Unkown"
    }
    
    var lastLocation: String {
        character.fragments.characterInfo.location?.name ?? "Unkown"
    }
    
    var gender: Gender {
        guard
            let genderString = character.fragments.characterInfo.gender,
            let gender = Gender(rawValue: genderString)
        else {
            return .unknown
        }
        return gender
    }
    
    var status: Status {
        guard
            let statusString = character.fragments.characterInfo.status,
            let status = Status(rawValue: statusString)
        else {
            return .unknown
        }
        return status
    }
}

extension CharacterViewModel {
    enum Gender: String {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
    }
    
    enum Status: String {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
}
