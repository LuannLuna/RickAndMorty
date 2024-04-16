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
                        .accessibilityIdentifier("statusLabel") // Accessibility identifier for the label
                    
                    Text(status.rawValue.capitalized)
                        .font(.subheadline)
                        .accessibilityIdentifier("statusValue") // Accessibility identifier for the value
            
                    switch status {
                    case .alive:
                        Text("💓")
                            .font(.subheadline)
                            .accessibilityHidden(true)
                            .accessibilityIdentifier("aliveIcon") // Accessibility identifier for the alive icon
                        
                    case .dead:
                        Text("💀")
                            .font(.subheadline)
                            .accessibilityHidden(true)
                            .accessibilityIdentifier("deadIcon") // Accessibility identifier for the dead icon
                        
                    case .unknown:
                        Text("⁇")
                            .font(.subheadline)
                            .accessibilityHidden(true)
                            .accessibilityIdentifier("unknownIcon") // Accessibility identifier for the unknown icon
                    }
                }
    }
}

#Preview {
    StatusInlineComponent(status: .alive)
}
