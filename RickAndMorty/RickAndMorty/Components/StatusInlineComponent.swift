//
//  StatusInlineComponent.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 15/04/24.
//

import SwiftUI

struct StatusInlineComponent: View {
    let status: Status
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("Status:")
                .font(.headline)
            Text(status.rawValue.capitalized)
                .font(.subheadline)
            switch status {
            case .alive:
                Text("💓")
                    .font(.subheadline)
            case .dead:
                Text("💀")
                    .font(.subheadline)
            case .unknown:
                Text("⁇")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    StatusInlineComponent(status: .alive)
}
