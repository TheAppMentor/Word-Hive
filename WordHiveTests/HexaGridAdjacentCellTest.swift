//
//  HexaGridTestAdjacentCells.swift
//  WordHiveTests
//
//  Created by Moorthy, Prashanth on 08/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import XCTest

class HexaGridAdjacentCellTest: XCTestCase {

    var hexGrid : HexCellGrid!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        hexGrid = HexCellGrid(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    func validatePositions(inputPostion : GridPosition, validPositions : [GridPosition]){
        
        let cells = hexGrid.findAdjacentCells(position: inputPostion)
        
        XCTAssertTrue(cells.count == validPositions.count, "🔴 Cell Count Should be 1; It is : \(cells.count)")
        
        let allPostions = cells.map {$0.gridPosition}
        validPositions.forEach {
            XCTAssertTrue(allPostions.contains($0), "🔴 Expected Postion => Not Found \($0)")
        }

    }
    
    func testGetAdjacentPos00() {
        
        let inputPostion = GridPosition(row:0,col:0)

        let validPositions = [GridPosition(row: 0, col: 1),
                              GridPosition(row: 1, col: 0),
                              GridPosition(row: 1, col: 1)]

        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos01() {
        let inputPostion = GridPosition(row:0,col:1)
        let validPositions = [GridPosition(row: 0, col: 0),
                              GridPosition(row: 0, col: 2),
                              GridPosition(row: 1, col: 1),
                              GridPosition(row: 1, col: 2)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    
    func testGetAdjacentPos02() {
        let inputPostion = GridPosition(row:0,col:2)
        let validPositions = [GridPosition(row: 0, col: 1),
                              GridPosition(row: 1, col: 2),
                              GridPosition(row: 1, col: 3)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos10() {
        let inputPostion = GridPosition(row:1,col:0)
        
        let validPositions = [GridPosition(row: 0, col: 0),
                              GridPosition(row: 1, col: 1),
                              GridPosition(row: 2, col: 0),
                              GridPosition(row: 2, col: 1)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos11() {
        let inputPostion = GridPosition(row:1,col:1)
        
        let validPositions = [GridPosition(row: 0, col: 0),
                              GridPosition(row: 0, col: 1),
                              GridPosition(row: 1, col: 0),
                              GridPosition(row: 1, col: 2),
                              GridPosition(row: 2, col: 1),
                              GridPosition(row: 2, col: 2)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos12() {
        let inputPostion = GridPosition(row:1,col:2)
        let validPositions = [GridPosition(row: 0, col: 1),
                              GridPosition(row: 0, col: 2),
                              GridPosition(row: 1, col: 1),
                              GridPosition(row: 1, col: 3),
                              GridPosition(row: 2, col: 2),
                              GridPosition(row: 2, col: 3)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos13() {
        let inputPostion = GridPosition(row:1,col:3)
        let validPositions = [GridPosition(row: 0, col: 2),
                              GridPosition(row: 1, col: 2),
                              GridPosition(row: 2, col: 3),
                              GridPosition(row: 2, col: 4)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    // Test Adjacent Row Index 2 :
    func testGetAdjacentPos20() {
        let inputPostion = GridPosition(row:2,col:0)
        
        let validPositions = [GridPosition(row: 1, col: 0),
                              GridPosition(row: 2, col: 1),
                              GridPosition(row: 3, col: 0)]

        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos21() {
        let inputPostion = GridPosition(row:2,col:1)
        let validPositions = [GridPosition(row: 1, col: 0),
                              GridPosition(row: 1, col: 1),
                              GridPosition(row: 2, col: 0),
                              GridPosition(row: 2, col: 2),
                              GridPosition(row: 3, col: 0),
                              GridPosition(row: 3, col: 1)]

        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos22() {
        let inputPostion = GridPosition(row:2,col:2)
        let validPositions = [GridPosition(row: 1, col: 1),
                              GridPosition(row: 1, col: 2),
                              GridPosition(row: 2, col: 1),
                              GridPosition(row: 2, col: 3),
                              GridPosition(row: 3, col: 1),
                              GridPosition(row: 3, col: 2)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos23() {
        let inputPostion = GridPosition(row:2,col:3)
        let validPositions = [GridPosition(row: 1, col: 2),
                              GridPosition(row: 1, col: 3),
                              GridPosition(row: 2, col: 2),
                              GridPosition(row: 2, col: 4),
                              GridPosition(row: 3, col: 2),
                              GridPosition(row: 3, col: 3)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos24() {
        let inputPostion = GridPosition(row:2,col:4)
        let validPositions = [GridPosition(row: 1, col: 3),
                              GridPosition(row: 2, col: 3),
                              GridPosition(row: 3, col: 3)]

        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }
    
    
    // Test Adjacent Row Index 3 :
    func testGetAdjacentPos30() {
        let inputPostion = GridPosition(row:3,col:0)
        
        let validPositions = [GridPosition(row: 2, col: 0),
                              GridPosition(row: 2, col: 1),
                              GridPosition(row: 3, col: 1),
                              GridPosition(row: 4, col: 0)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }
    
    func testGetAdjacentPos31() {
        let inputPostion = GridPosition(row:3,col:1)
        let validPositions = [GridPosition(row: 2, col: 1),
                              GridPosition(row: 2, col: 2),
                              GridPosition(row: 3, col: 0),
                              GridPosition(row: 3, col: 2),
                              GridPosition(row: 4, col: 0),
                              GridPosition(row: 4, col: 1)]

        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos32() {
        let inputPostion = GridPosition(row:3,col:2)
        let validPositions = [GridPosition(row: 2, col: 2),
                              GridPosition(row: 2, col: 3),
                              GridPosition(row: 3, col: 1),
                              GridPosition(row: 3, col: 3),
                              GridPosition(row: 4, col: 1),
                              GridPosition(row: 4, col: 2)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos33() {
        let inputPostion = GridPosition(row:3,col:3)
        let validPositions = [GridPosition(row: 2, col: 3),
                              GridPosition(row: 2, col: 4),
                              GridPosition(row: 3, col: 2),
                              GridPosition(row: 4, col: 2)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }


    func testGetAdjacentPos40() {
        let inputPostion = GridPosition(row:4,col:0)
        let validPositions = [GridPosition(row: 3, col: 0),
                              GridPosition(row: 3, col: 1),
                              GridPosition(row: 4, col: 1)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }

    func testGetAdjacentPos41() {
        let inputPostion = GridPosition(row:4,col:1)
        let validPositions = [GridPosition(row: 3, col: 1),
                              GridPosition(row: 3, col: 2),
                              GridPosition(row: 4, col: 0),
                              GridPosition(row: 4, col: 2)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }
    
    func testGetAdjacentPos42() {
        let inputPostion = GridPosition(row:4,col:2)
        let validPositions = [GridPosition(row: 3, col: 2),
                              GridPosition(row: 3, col: 3),
                              GridPosition(row: 4, col: 1)]
        
        validatePositions(inputPostion: inputPostion, validPositions: validPositions)
    }
}
