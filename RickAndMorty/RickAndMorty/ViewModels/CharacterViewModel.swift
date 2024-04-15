//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 11/04/24.
//

import Foundation
import Apollo

struct CharacterViewModel {
    private let character: CharacterInfo
    
    init(character: CharacterInfo) {
        self.character = character
    }
    
    var id: GraphQLID {
        character.id ?? GraphQLID()
    }
    
    var imageUrl: URL? {
        guard
            let urlString = character.image,
            let url = URL(string: urlString)
        else {
            return nil
        }
        return url
    }
    
    var name: String {
        character.name ?? "--"
    }
    
    var origin: String {
        character.origin?.name ?? "Unkown"
    }
    
    var dimension: String {
        character.origin?.dimension ?? "Unkown"
    }
    
    var lastLocation: String {
        character.location?.name ?? "Unkown"
    }
    
    var gender: Gender {
        character.gender.asGender
    }
    
    var status: Status {
        character.status.asStatus
    }
}

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


extension String? {
    var asStatus: Status {
        guard
            let statusString = self,
              let status = Status(rawValue: statusString)
        else {
            return .unknown
        }
        return status
    }
    
    var asGender: Gender {
        guard
            let genderString = self,
            let gender = Gender(rawValue: genderString)
        else {
            return .unknown
        }
        return gender
    }
}
