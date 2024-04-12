//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 11/04/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.characters, id: \.id) { char in
                    NavigationLink {
                        CharacterDetailView()
                    } label: {
                        HomeViewListItem(
                            character: char
                        )
                        .onAppear {
                            viewModel.loadMoreItemsIfNeed(currentChar: char)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .onAppear {
                viewModel.fetchAllCharacters()
            }
            .navigationTitle("Rick and Morty")
        }
    }
}

#Preview {
    HomeFactory.make()
}
