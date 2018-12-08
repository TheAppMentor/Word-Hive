//
//  HexaGridPathTest.swift
//  WordHiveTests
//
//  Created by Moorthy, Prashanth on 08/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import XCTest

class HexaGridPathTest: XCTestCase {

    var hexGrid : HexCellGrid!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        hexGrid = HexCellGrid(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPathsFrom00() {
        hexGrid.getAllPaths(paths: [hexGrid.cellAtPosition(position: GridPosition(row:0,col:0))!])
        print("🍏 Paths found : \(hexGrid.allPaths.count)")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
