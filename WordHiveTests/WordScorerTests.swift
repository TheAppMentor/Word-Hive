//
//  WordScorerTests.swift
//  WordHiveTests
//
//  Created by Moorthy, Prashanth on 10/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import XCTest

class WordScorerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWordScore_Hello() {
       let wScore = WordScorer().scoreForString(inputString: "Hello")
        XCTAssert(wScore == 8, "Score Mismatch Should be 8. It is \(wScore)")
    }

    func testWordScore_hellenizations() {
        let wScore = WordScorer().scoreForString(inputString: "hellenizations")
        XCTAssert(wScore == 26, "Score Mismatch Should be 26. It is \(wScore)")
    }

    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
