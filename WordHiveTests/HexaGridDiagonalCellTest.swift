//
//  HexaGridTests.swift
//  WordHiveTests
//
//  Created by Moorthy, Prashanth on 07/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import XCTest

class HexaGridTests: XCTestCase {
    
    var hexGrid : HexCellGrid!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        hexGrid = HexCellGrid(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDiagonalPos00() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cells = hexGrid.findCellDiagonal(position: GridPosition(row:0,col:0))
        XCTAssertTrue(cells.count == 1, "Cell Count Should be 1; It is : \(cells.count)")
        XCTAssertTrue(cells.first?.position?.row == 1 && cells.first?.position?.col == 1, "Cell Count Should be 1; It is : \(cells.count)")
    }

    func testGetDiagonalPos01() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cells = hexGrid.findCellDiagonal(position: GridPosition(row:0,col:1))
        XCTAssertTrue(cells.count == 2, "Cell Count Should be 1; It is : \(cells.count)")
        //XCTAssertTrue(cells.first?.position?.row == 1 && cells.first?.position?.col == 1, "Cell Count Should be 1; It is : \(cells.count)")
    }

    func testGetDiagonalPos02() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cells = hexGrid.findCellDiagonal(position: GridPosition(row:0,col:2))
        XCTAssertTrue(cells.count == 2, "Cell Count Should be 2; It is : \(cells.count)")
        XCTAssertTrue(cells.first?.position?.row == 1 && cells.first?.position?.col == 2, "Position is wrong")
        XCTAssertTrue(cells.last?.position?.row == 1 && cells.last?.position?.col == 3, "Position is wrong")
    }


    func testGetDiagonalPos22() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cells = hexGrid.findCellDiagonal(position: GridPosition(row:2,col:2))
        XCTAssertTrue(cells.count == 4, "Cell Count Should be 1; It is : \(cells.count)")
        //XCTAssertTrue(cells.first?.position?.row == 3 && cells.first?.position?.col == 2, "Cell Count Should be 1; It is : \(cells.count)")
    }

    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
