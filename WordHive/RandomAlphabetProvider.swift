//
//  RandomAlphabetProvider.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 5/2/17.
//  Copyright © 2017 Moorthy, Prashanth. All rights reserved.
//

import Foundation

struct RandomAlphabetProvider {
    
    static let shared = RandomAlphabetProvider()
    
    private let array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var randomAlphabet : String{
        let randomInt = randomNumber(inRange: 0...25)
        return array[randomInt]
    }
    
    
    private func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = (range.upperBound - range.lowerBound + 1).toIntMax()
        let value = arc4random().toIntMax() % length + range.lowerBound.toIntMax()
        return T(value)
    }
    
    
}
