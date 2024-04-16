//
//  CharacterCard.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 15/04/24.
//

import SwiftUI

struct CharacterCard: View {
    let character: CharacterViewModel
    var shadowColor: CGFloat = 5
    
    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    URLImage(url: character.imageUrl, size: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        .accessibilityAddTraits(.isImage)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(character.name)
                            .accessibilityLabel(character.name)
                            .accessibilityHint("Name of the current character")
                            .font(.headline)
                            .foregroundColor(.primary)
                        StatusInlineComponent(status: character.status)
                        Text("Gender: \(character.gender)")
                    }
                    Spacer()
                }
                Text("Origin: \(character.origin)")
                Text("Location: \(character.lastLocation)")
            }
            .accessibilityElement(children: .ignore)
        }
        .accessibilityLabel(
            Text("Name: \(character.name), status: \(character.status.rawValue), gender: \(character.gender.rawValue). This caracthers was last seen in: \(character.lastLocation). The origin is: \(character.origin)")
        )
        .accessibilityHint("Select to see more details")
        .accessibilityAddTraits(.isButton)
        .foregroundColor(.primary)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: shadowColor)
        .padding(.vertical, 5)
    }
}
