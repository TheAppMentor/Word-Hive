//
//  HexGrid.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 5/1/17.
//  Copyright © 2017 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

protocol CellGrid {
}

public class  HexCellGrid : CellGrid {

    public var gridNode : HexCellGridNode!
    
    let maxRows : UInt = 5 // cant change this..cellCountForRow is hard coded !
    
    var cells : [HexCell] = []
    var selectedCells : [HexCell] = []
    
    var selectedWord : String {
        var tempStr = ""
        selectedCells.forEach({tempStr = tempStr + $0.textValue})
        return tempStr
    }
    
    public init(frame: CGRect) {
        populateGrid(cellWidth: 125.0, frame: frame)
        do {
            gridNode = try HexCellGridNode(size: CGSize(width: frame.width, height: frame.height), grid: self)
        }catch{
            assertionFailure("Unable to form Grid Node")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func populateGrid(cellWidth : CGFloat, frame : CGRect) {
        
//        let cellsPerRow : Int = Int(frame.width.truncatingRemainder(dividingBy: cellWidth))
        
        allGridPositions().forEach { (gridPos) in
           

            let cellFrame = CGRect(x: (cellWidth * CGFloat(gridPos.col)) + gridSpacingFor(row: Int(gridPos.row), cellWidth: cellWidth) - frame.width/2.0,
                                   y: cellWidth * CGFloat(gridPos.row) - frame.height/2.0,
                                   width: cellWidth,
                                   height: cellWidth)

            // let cellFrame = CGRect(x: (cellWidth * CGFloat(gridPos.col)) + gridSpacingFor(row: Int(gridPos.row), cellWidth: cellWidth), y: cellWidth * CGFloat(gridPos.row) , width: cellWidth, height: cellWidth)
            
            let theCell = HexCell(frame: cellFrame, gridPosition: gridPos, textValue: RandomAlphabetProvider.shared.randomAlphabet)
            cells.append(theCell)
        }
    }
    
    func allGridPositions() -> [GridPosition]{
        
        var allGridPos : [GridPosition] = []
        
        for theRow in 0..<maxRows {
            for theCol in 0..<cellCountForRow(row: theRow){
               allGridPos.append(GridPosition(row : theRow,col: theCol))
            }
        }
        return allGridPos
    }
    
    func cellCountForRow(row : UInt) -> UInt {
        switch row {
            case 0,4    :   return 3
            case 1,3    :   return 4
            case 2      :   return 5
            default     :   return 0
        }
    }
    
    func gridSpacingFor(row : Int, cellWidth : CGFloat) -> CGFloat {
        switch row {
            case 0,4    :   return cellWidth * 1.0
            case 1,3    :   return cellWidth * 0.5
            case 2      :   return 0.0
            default     :   return 0.0
        }
    }

    
//    func populateGrid(cellWidth : CGFloat) {
//        
//        let cellsPerRow : Int = Int(frame.width.truncatingRemainder(dividingBy: cellWidth))
//        
//        for row in 0...10{
//            let rowShift = row % 2 == 0 ? cellWidth/2 : 0.0
//            
//            for col in 0...cellsPerRow{
//                let  theCell = HexCell(frame: CGRect(x: (cellWidth * CGFloat(col) - rowShift), y: cellWidth * CGFloat(row) - 5.0 , width: cellWidth, height: cellWidth))
//                theCell.touchEventDelegate = self
//                addSubview(theCell)
//            }
//        }
//    }

    
    /*
    func touchesMovedToLocation(touch : UITouch){
        let currentPostion = touch.location(in: self)
        for eachSubView in subviews{
            if var hexCell = eachSubView as? HexCell{
                if hexCell.frame.contains(currentPostion){
                    //hexCell.layer.backgroundColor = UIColor.purple.cgColor
                    if selectedCells.contains(hexCell) == false{  // Each Cell can be selected only once.
                        hexCell.isSelected = true
                        selectedCells.append(hexCell)
                    }
//                    print("Value is \((eachSubView as! HexCell).textValue)")
                }
            }
        }
    }
    
    func touchesEnded(){
        selectedCells.forEach({_ in
            print("Touches Ended.")
            //$0.layer.backgroundColor = UIColor.green.cgColor
        })
        print("Selected Word is : \(selectedWord)")
        selectedCells = []
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Grid : Touches began....")
    }
 
 */
    func isCellSelected(cell : HexCell){
       
    }
    
    func getPositionForCell(cell : HexCell){
        
    }
    
    func findRowAbove(position : GridPosition) -> UInt?{
        switch position.row {
            case 0  : return nil
            default : return position.row - 1
        }
    }

    func findRowBelow(position : GridPosition) -> UInt?{
        switch position.row {
        case maxRows : return nil
        default : return position.row + 1
        }
    }

    func findColLeft(position : GridPosition) -> UInt?{
        switch position.col{
            case 0 : return nil
            default : return position.col - 1
        }
    }

    func findColRight(position : GridPosition) -> UInt?{
        switch cellCountForRow(row: position.row){
        case position.col + 1 : return nil
        default : return position.col + 1
        }
    }
    
    func cellAtPosition(position : GridPosition) -> HexCell?{
        let fetchedCells = cells.filter({$0.gridPosition == position})
        
        if fetchedCells.count == 1 {return fetchedCells.first}
        
        if fetchedCells.count > 1 {
            assertionFailure("Fethched cells count is > 1 : Function : cellAtPosition")
        }
        
        return nil
    }
    
    func findCellAbove(position : GridPosition) -> HexCell?{
        if let rowAbove = findRowAbove(position: position){
            return cellAtPosition(position:GridPosition(row:rowAbove,col:position.col))
        }
        return nil
    }

    func findCellBelow(position : GridPosition) -> HexCell?{
        if let rowBelow = findRowBelow(position: position){
            return cellAtPosition(position:GridPosition(row:rowBelow,col:position.col))
        }
        return nil
    }
    
    func findCellDiagonal(position : GridPosition) -> [HexCell]{
        
        var fetchedCells : [HexCell] = []
        let inputRowCellCount = cellCountForRow(row: position.row)
        
        
        if let rowAbove = findRowAbove(position: position){
            let cellCountRowAbove = cellCountForRow(row: rowAbove)
            
            // Find Top Left Cell
            if (cellCountRowAbove < inputRowCellCount && position.col > 0) || cellCountRowAbove > inputRowCellCount{
               
                let colToFetch = cellCountRowAbove < inputRowCellCount ? position.col - 1 : position.col
                
                if let topLeftCell = cellAtPosition(position: GridPosition(row: rowAbove,col: colToFetch)){
                    fetchedCells.append(topLeftCell)
                }
            }
            
            // Find Top Right Cell
            if (cellCountRowAbove < inputRowCellCount && position.col <= cellCountRowAbove) || cellCountRowAbove > inputRowCellCount{
                
                let colToFetch = cellCountRowAbove < inputRowCellCount ? position.col : position.col + 1
                
                if let topLeftCell = cellAtPosition(position: GridPosition(row: rowAbove,col: colToFetch)){
                    fetchedCells.append(topLeftCell)
                }
            }
        }
        
        if let rowBelow = findRowBelow(position: position){
            let cellCountRowBelow = cellCountForRow(row: rowBelow)
            
            // Find Bottom Left Cell
            if (cellCountRowBelow < inputRowCellCount && position.col > 0) || cellCountRowBelow > inputRowCellCount{
                
                let colToFetch = cellCountRowBelow < inputRowCellCount ? position.col - 1 : position.col
                
                if let bottomLeftCell = cellAtPosition(position: GridPosition(row: rowBelow,col: colToFetch)){
                    fetchedCells.append(bottomLeftCell)
                }
            }

            if (cellCountRowBelow < inputRowCellCount) || (cellCountRowBelow > inputRowCellCount){
                
                let colToFetch = cellCountRowBelow < inputRowCellCount ? position.col : position.col + 1
                
                if let bottomRightCell = cellAtPosition(position: GridPosition(row: rowBelow,col: colToFetch)){
                    fetchedCells.append(bottomRightCell)
                }
            }
        }
        
        
        return fetchedCells
    }
    
    func findRightCell(position : GridPosition) -> HexCell?{
        let cellCount = cellCountForRow(row: position.row)
        if position.col + 1 >= cellCount{
            return nil
        }
        return cellAtPosition(position: GridPosition(row : position.row, col : position.col + 1))
    }
    
    func findLeftCell(position : GridPosition) -> HexCell?{
        if position.col == 0 {
            return nil
        }
        return cellAtPosition(position: GridPosition(row : position.row, col : position.col - 1))
    }
    
    
    func findAdjacentCells(position : GridPosition) -> [HexCell]{
        
        var adjacentCells : [HexCell] = []
        if let leftCell = findLeftCell(position: position){
            adjacentCells.append(leftCell)
        }
        if let rightCell = findRightCell(position: position){
            adjacentCells.append(rightCell)
        }
        
        adjacentCells.append(contentsOf: findCellDiagonal(position: position))
        return adjacentCells
    }
    
    func hilightAdjacentCells(cell : HexCell){
        
    }

    var allWords : Set<String> = []
    
    func getAllWordsInGrid(){
        allGridPositions().forEach {
            if let validCell = cellAtPosition(position: $0){
                getAllWordsStartingWithCell(paths: [validCell])
            }
        }

        print("\n\n>>>>>>>> Found \(allWords.count) Words <<<<<<<<<")
        allWords.forEach { print("\($0) -> \(WordScorer().scoreForString(inputString: $0))") }
    }
    
    
    func getAllWordsStartingWithCell(paths : [HexCell]){
        let pathLetters = paths.map({return $0.textValue})

        let pathString = pathLetters.reduce("",+)
        let dict = DictionaryManager.shared.findWordsWithPrefix(prefix: pathString)
        
        guard !dict.isEmpty else {
            return
        }
        
        let adjCells = findAdjacentCells(position: paths.last!.gridPosition)
        var newPaths : [[HexCell]] = []
        
        adjCells.forEach {
            if  paths.contains($0) == false {
                // Why simply fin
                var tempPath = paths
                tempPath.append($0)
                newPaths.append(tempPath)
            }
        }
       
        let letterArr = newPaths.map({
            return $0.map({
                $0.textValue
            })
        })
        
        letterArr.forEach {
            let word = $0.reduce("", +)
            if DictionaryManager.shared.contains(word: word){
                //print("Adding Word : \(word)")
                allWords.insert(word)
            }
        }
        
        newPaths.forEach {
            getAllWordsStartingWithCell(paths: $0)
        }
    }
}
