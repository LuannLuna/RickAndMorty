//
//  URLImage.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 15/04/24.
//

import SwiftUI

struct URLImage: View {
    var url: URL?
    var size: CGFloat?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    
            case .failure:
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size ?? 100, height: size ?? 100)
                    .foregroundColor(.gray)
            case .empty:
                ProgressView()
                    .frame(width: size ?? 100, height: size ?? 100)
            }
        }
    }
}

#Preview {
    URLImage()
}
