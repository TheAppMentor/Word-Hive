//
//  HexaGridRightCellTest.swift
//  WordHiveTests
//
//  Created by Moorthy, Prashanth on 08/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import XCTest

class HexaGridRightCellTest: XCTestCase {
    var hexGrid : HexCellGrid!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        hexGrid = HexCellGrid(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }


    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


    // Row 0 Tests :
    
    func testRightCell00() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 0, col :0))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 0, col: 1), "Position mismatch")
    }
    
    func testRightCell01() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 0, col :1))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 0, col: 2), "Position mismatch")
    }
    
    func testRightCell02() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 0, col :2))
        XCTAssertNil(rightCell)
    }
    
    // Row 1 Tests :
    
    func testRightCell10() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 1, col :0))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 1, col: 1), "Position mismatch")
    }
    
    func testRightCell11() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 1, col :1))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 1, col: 2), "Position mismatch")
    }
    
    func testRightCell12() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 1, col :2))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 1, col: 3), "Position mismatch")
    }
    
    func testRightCell13() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 1, col :3))
        XCTAssertNil(rightCell)
    }
    
    // Row 2 Tests :
    func testRightCell20() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 2, col :0))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 2, col: 1), "Position mismatch")
    }
    
    func testRightCell21() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 2, col :1))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 2, col: 2), "Position mismatch")
    }
    
    func testRightCell22() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 2, col :2))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 2, col: 3), "Position mismatch")
    }
    
    func testRightCell23() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 2, col :3))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 2, col: 4), "Position mismatch")
    }
    
    func testRightCell24() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 2, col :4))
        XCTAssertNil(rightCell)
    }
    
    // Row 3 Tests :
    func testRightCell30() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 3, col :0))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 3, col: 1), "Position mismatch")
    }
    
    func testRightCell31() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 3, col :1))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 3, col: 2), "Position mismatch")
    }
    
    func testRightCell32() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 3, col :2))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 3, col: 3), "Position mismatch")
    }
    
    func testRightCell33() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 3, col :3))
        XCTAssertNil(rightCell)
    }
    
    // Row 4 Tests :
    func testRightCell40() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 4, col :0))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 4, col: 1), "Position mismatch")
    }
    
    func testRightCell41() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 4, col :1))
        XCTAssertTrue(rightCell?.position == GridPosition(row: 4, col: 2), "Position mismatch")
    }
    
    func testRightCell42() {
        let rightCell = hexGrid.findRightCell(position: GridPosition(row : 4, col :2))
        XCTAssertNil(rightCell)
    }

    
}
