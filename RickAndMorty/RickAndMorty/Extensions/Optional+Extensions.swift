//
//  Optional+Extensions.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 12/04/24.
//

import Foundation

extension Optional {
    var isNil: Bool {
        self == nil
    }
    
    var isNotNil: Bool {
        self != nil
    }
}
