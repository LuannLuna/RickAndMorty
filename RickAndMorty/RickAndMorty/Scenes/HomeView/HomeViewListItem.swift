//
//  HomeViewListItem.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 11/04/24.
//

import SwiftUI

struct HomeViewListItem: View {
    let character: CharacterViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10) {
                // Exibir a imagem do personagem
                VStack(alignment: .leading) {
                    AsyncImage(url: character.imageUrl) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
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
                }
                

                VStack(alignment: .leading, spacing: 5) {
                    Text(character.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                    StatusInlineComponent(status: character.status)
                    HStack(alignment: .top, spacing: 10) {
                        Text("Origin:")
                            .font(.headline)
                        Text(character.origin)
                            .font(.subheadline)
                    }
                    HStack(alignment: .top, spacing: 10) {
                        Text("Last location: ")
                            .font(.headline)
                        Text(character.lastLocation)
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding(.horizontal, 5)
        .padding(.vertical)
    }
}
