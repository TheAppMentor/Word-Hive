//
//  HexCellGrindNode.swift
//  WordHiveTests
//
//  Created by Moorthy, Prashanth on 15/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import XCTest

class HexCellGrindNode: XCTestCase {

    //var hexNode : HexCell!
    var hexGrid : HexCellGrid!
        
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //hexNode = HexCell(frame: CGRect(x: 0, y: 0, width: 200.0, height: 200.0), gridPosition: GridPosition(row : 2, col : 2), textValue: "M")
        hexGrid = HexCellGrid(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHexNodeChildrenCount_1() {
        XCTAssert(hexGrid.gridNode.children.count == 19, "🔴 Count Mismatch HexGrid \(hexGrid.gridNode.children.count) : Expected : 19")
    }

    func testsHexNodeGridPositionCheck(){
        // Check if
        XCTAssert(hexGrid.gridNode.children.count == 19, "🔴 Count Mismatch HexGrid \(hexGrid.gridNode.children.count) : Expected : 19")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
