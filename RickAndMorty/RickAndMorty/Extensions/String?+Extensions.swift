//
//  String+Extensions.swift
//  RickAndMorty
//
//  Created by Luann Marques Luna on 15/04/24.
//

import Foundation

extension String? {
    var unwraped: String {
        self ?? "Unkown"
    }
    
    var asStatus: Status {
        guard
            let statusString = self,
              let status = Status(rawValue: statusString)
        else {
            return .unknown
        }
        return status
    }
    
    var asGender: Gender {
        guard
            let genderString = self,
            let gender = Gender(rawValue: genderString)
        else {
            return .unknown
        }
        return gender
    }
}
