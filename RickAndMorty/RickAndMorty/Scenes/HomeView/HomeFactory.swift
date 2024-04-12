//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 12/04/24.
//

import Foundation

enum HomeFactory {
    static func make() -> HomeView {
        let service = CharactersService()
        let viewModel = HomeViewViewModel(service: service)
        return HomeView(viewModel: viewModel)
    }
}
