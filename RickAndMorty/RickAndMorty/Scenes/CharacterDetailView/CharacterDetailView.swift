//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 12/04/24.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @ObservedObject var viewModel: CharacterDetailViewViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                if let character = viewModel.character {
                    VStack(alignment: .leading, spacing: 10) {
                        URLImage(url: character.imageUrl)
                        Text(character.name)
                            .font(.title)
                            .accessibilityHidden(true)
                        StatusInlineComponent(status: character.status)
                            .accessibilityHidden(true)
                        if !character.type.isEmpty {
                            Text("Type: \(character.type)")
                        }
                        Text("Gender: \(character.gender)")
                        Text("Origin: \(character.origin) (\(character.dimension))")
                        Text("Location: \(character.lastLocation)")
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(
                        Text("Name: \(character.name), origin: \(character.origin). Appears in \(character.episode.count) episodes")
                    )
                    
                    Text("Episodes: ")
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(character.episode, id: \.self) { episode in
                            NavigationLink {
                                EpisodeDetailFactory.make(episode: episode)
                            } label: {
                                Text(episode)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .font(.footnote)
                                    .background(
                                        Color.gray
                                            .clipShape(Capsule())
                                    )
                            }
                        }
                    }
                    
                } else {
                    ProgressView()
                }
            }
            .onAppear {
                viewModel.fetchDetail()
            }
        }
        .padding(.horizontal)
        .navigationBarTitle("", displayMode: .inline)
    }
}
