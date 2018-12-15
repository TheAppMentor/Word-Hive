//
//  HexaGridLeftCellTest.swift
//  WordHiveTests
//
//  Created by Moorthy, Prashanth on 08/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import XCTest

class HexaGridLeftCellTest: XCTestCase {

    var hexGrid : HexCellGrid!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        hexGrid = HexCellGrid(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Row 0 Tests :

    func testLeftCell00() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 0, col :0))
        XCTAssertNil(leftCell)
    }

    func testLeftCell01() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 0, col :1))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 0, col: 0), "Position mismatch")
    }
    
    func testLeftCell02() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 0, col :2))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 0, col: 1), "Position mismatch")
    }

    // Row 1 Tests :
    
    func testLeftCell10() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 1, col :0))
        XCTAssertNil(leftCell)
    }
    
    func testLeftCell11() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 1, col :1))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 1, col: 0), "Position mismatch")
    }
    
    func testLeftCell12() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 1, col :2))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 1, col: 1), "Position mismatch")
    }
    
    func testLeftCell13() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 1, col :3))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 1, col: 2), "Position mismatch")
    }
    
    // Row 2 Tests :
    func testLeftCell20() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 2, col :0))
        XCTAssertNil(leftCell)
    }
    
    func testLeftCell21() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 2, col :1))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 2, col: 0), "Position mismatch")
    }
    
    func testLeftCell22() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 2, col :2))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 2, col: 1), "Position mismatch")
    }
    
    func testLeftCell23() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 2, col :3))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 2, col: 2), "Position mismatch")
    }

    func testLeftCell24() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 2, col :4))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 2, col: 3), "Position mismatch")
    }

    // Row 3 Tests :
    func testLeftCell30() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 3, col :0))
        XCTAssertNil(leftCell)
    }
    
    func testLeftCell31() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 3, col :1))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 3, col: 0), "Position mismatch")
    }
    
    func testLeftCell32() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 3, col :2))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 3, col: 1), "Position mismatch")
    }
    
    func testLeftCell33() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 3, col :3))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 3, col: 2), "Position mismatch")
    }

    // Row 4 Tests :
    func testLeftCell40() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 4, col :0))
        XCTAssertNil(leftCell)
    }
    
    func testLeftCell41() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 4, col :1))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 4, col: 0), "Position mismatch")
    }
    
    func testLeftCell42() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 4, col :2))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 4, col: 1), "Position mismatch")
    }
    
    func testLeftCell43() {
        let leftCell = hexGrid.findLeftCell(position: GridPosition(row : 4, col :3))
        XCTAssertTrue(leftCell?.gridPosition == GridPosition(row: 4, col: 2), "Position mismatch")
    }

    
}
