//
//  GridPosition.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 06/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import Foundation

struct GridPosition : Equatable, Codable {
    var row : UInt
    var col : UInt
    
    static func ==(lhs : GridPosition, rhs : GridPosition) -> Bool{
        return (lhs.row == rhs.row && lhs.col == rhs.col)
    }

    subscript(_ row: UInt, _ col: UInt) -> GridPosition {
        get {
            return GridPosition(row: row, col: col)
        }
    }
}
