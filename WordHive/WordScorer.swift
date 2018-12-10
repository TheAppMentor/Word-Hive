//
//  WordScore.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 10/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import Foundation

struct WordScorer {
    
    // 1 point: E ×12, A ×9, I ×9, O ×8, N ×6, R ×6, T ×6, L ×4, S ×4, U ×4
    // 2 points: D ×4, G ×3
    // 3 points: B ×2, C ×2, M ×2, P ×2
    // 4 points: F ×2, H ×2, V ×2, W ×2, Y ×2
    // 5 points: K ×1
    // 8 points: J ×1, X ×1
    // 10 points: Q ×1, Z ×1
    
    func scoreForString(inputString : String) -> UInt{
        let wordScore = inputString.uppercased().characters.map({scoreForCharacter(c: $0)}).reduce(0, +)
        return wordScore
    }
    
    private func scoreForCharacter(c : Character) -> UInt{
        switch c {
        case "E", "A", "I", "O", "N", "R", "T", "L", "S", "U" : return 1
        case "D", "G" : return 2
        case "B","C","M","P" : return 3
        case "F","H","V","W","Y" : return 4
        case "K" : return 5
        case "J", "X" : return 8
        case "Q", "Z" : return 10
            
        default:
            assertionFailure("Unknown Character")
        }
        return 0
    }
}
