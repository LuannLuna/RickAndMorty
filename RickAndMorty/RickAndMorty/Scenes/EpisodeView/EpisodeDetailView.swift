//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 15/04/24.
//

import SwiftUI

struct EpisodeDetailView: View {
    @ObservedObject var viewModel: EpisodeDetailViewModel
    
    var body: some View {
        ScrollView {
            if let episodeViewModel = viewModel.episodeViewModel {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Name: \(episodeViewModel.name)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .accessibilityLabel(
                            Text("Episode named: \(episodeViewModel.name)")
                        )
                    
                    Text("Air Date: \(episodeViewModel.airDate.unwraped)")
                        .font(.title3)
                        .accessibilityLabel(
                            Text("It aired on \(episodeViewModel.airDate.unwraped)")
                        )
                    
                    Text("Characters:")
                        .font(.headline)
                        .padding(.top)
                    
                    ForEach(episodeViewModel.characters, id: \.id) { character in
                        NavigationLink {
                            CharacterDetailFactory.make(characterID: character.id)
                        } label: {
                            CharacterCard(character: character)
                                .accessibilityElement(children: .ignore)
                                .accessibilityLabel(
                                    Text("Name: \(character.name)")
                                )
                        }
                    }
                }
                .padding(.horizontal)
            } else {
                ProgressView()
            }
        }
        .navigationBarTitle(viewModel.episodeViewModel?.episode ?? "", displayMode: .inline)
        .onAppear {
            viewModel.fetchEpisodeDetail()
        }
    }
}

#Preview {
    EpisodeDetailView(
        viewModel: EpisodeDetailViewModel(
            episode: "S01E08",
            service: ApolloService()
        )
    )
}
