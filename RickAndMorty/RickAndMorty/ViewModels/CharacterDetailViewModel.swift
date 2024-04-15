//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 12/04/24.
//

import Foundation

struct CharacterDetailViewModel {
    private let characterDetail: CharacterDetail
    
    init(characterDetail: CharacterDetail) {
        self.characterDetail = characterDetail
    }
    
    var imageUrl: URL? {
        guard
            let urlString = characterDetail.fragments.characterInfo.image,
            let url = URL(string: urlString)
        else {
            return nil
        }
        return url
    }
    
    var name: String {
        characterDetail.fragments.characterInfo.name ?? "Unkown"
    }
    
    var status: Status {
        characterDetail.fragments.characterInfo.status.asStatus
    }
    
    var gender: Gender {
        characterDetail.fragments.characterInfo.gender.asGender
    }
    
    var origin: String {
        characterDetail.fragments.characterInfo.origin?.name ?? "Unkown"
    }
    
    var dimension: String {
        characterDetail.fragments.characterInfo.origin?.dimension ?? "Unkown"
    }
    
    var lastLocation: String {
        characterDetail.fragments.characterInfo.location?.name ?? "Unkown"
    }
    
    var type: String {
        characterDetail.fragments.characterInfo.type ?? "Unkown"
    }
    
    var episode: [String] {
        characterDetail.episode.compactMap { $0?.episode }
    }
}

//struct EpisodeViewModel {
//    private var _episode: FetchCharacterQuery.Data.Character.Episode
//    
//    init(episode: FetchCharacterQuery.Data.Character.Episode) {
//        self._episode = episode
//    }
//    
//    var name: String {
//        _episode.name ?? "--"
//    }
//    
//    var airDate: String? {
//        _episode.airDate
//    }
//    
//    var episode: String {
//        _episode.episode ?? ""
//    }
//    
//    var characters: [CharacterViewModel] {
//        _episode.characters.compactMap {
//            guard let char = $0?.fragments.characterInfo else { return nil }
//            return CharacterViewModel(character: char)
//        }
//    }
//}
