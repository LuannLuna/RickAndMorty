//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 11/04/24.
//

import SwiftUI
import Apollo

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.characters, id: \.id) { char in
                    NavigationLink {
                        CharacterDetailFactory.make(characterID: char.id)
                    } label: {
                        CharacterCard(character: char, shadowColor: 0, expandedVersion: false)
                            .onAppear {
                                viewModel.loadMoreItemsIfNeed(currentChar: char)
                            }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Rick and Morty")
            .accessibilityLabel("Navigation Bar")
            .onAppear {
                viewModel.fetchAllCharacters()
            }
            .searchable(text: $viewModel.searchText) {
                ForEach(viewModel.searchResult, id: \.self) { char in
                    NavigationLink {
                        CharacterDetailFactory.make(characterID: char.id ?? GraphQLID())
                    } label: {
                        HStack(spacing: 5) {
                            URLImage(url: char.url, size: 25)
                                .clipShape(Circle())
                            Text(char.name.unwraped).searchCompletion(char)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                        }
                        .foregroundColor(.primary)
                        .accessibilityIdentifier("result-search-item")
                    }
                }
            }
            .onChange(of: viewModel.searchText) {
                viewModel.findCharacters()
            }
        }
    }
}

#Preview {
    HomeFactory.make()
}
