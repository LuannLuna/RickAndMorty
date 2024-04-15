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
                    AsyncImage(url: character.imageUrl) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure:
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        case .empty:
                            ProgressView()
                                .frame(width: 100, height: 100)
                        }
                    }
                    Text(character.name)
                        .font(.title)
                    StatusInlineComponent(status: character.status)
                    if !character.type.isEmpty {
                        Text("Type: \(character.type)")
                    }
                    Text("Gender: \(character.gender)")
                    Text("Origin: \(character.origin) (\(character.dimension))")
                    Text("Location: \(character.lastLocation)")
                    
                    Text("Episodes: ")
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(character.episode, id: \.self) { episode in
                            Text(episode)
                                .padding(5)
                                .font(.footnote)
                                .background(
                                    Color.gray
                                        .clipShape(Capsule())
                                )
                        }
                    }
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
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
