//
//  HexGrid.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 5/1/17.
//  Copyright © 2017 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import UIKit

class CellGrid : UIView{
    
}

class HexCellGrid : UIView, CellHilightDelegate {
    
    let maxRows = 5 // cant change this..cellCountForRow is hard coded !
    
    var cells : [HexCellGrid] = []
    var selectedCells : [HexCellGrid] = []
    
    var selectedWord : String {
        var tempStr = ""
        selectedCells.forEach({tempStr = tempStr + $0.textValue})
        return tempStr
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        populateGrid(cellWidth: 75.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func populateGrid(cellWidth : CGFloat) {
        
//        let cellsPerRow : Int = Int(frame.width.truncatingRemainder(dividingBy: cellWidth))
        
        for theRow in 0..<maxRows {
            for col in 0..<cellCountForRow(row: theRow){
                let  theCell = HexCell(frame: CGRect(x: (cellWidth * CGFloat(col)) + gridSpacingFor(row: theRow, cellWidth: cellWidth), y: cellWidth * CGFloat(theRow) , width: cellWidth, height: cellWidth))
                theCell.touchEventDelegate = self
                addSubview(theCell)
            }
        }
    }
    
    func cellCountForRow(row : Int) -> Int {
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

    func touchesMovedToLocation(touch : UITouch){
        let currentPostion = touch.location(in: self)
        for eachSubView in subviews{
            if let hexCell = eachSubView as? HexCell{
                if hexCell.frame.contains(currentPostion){
                    hexCell.layer.backgroundColor = UIColor.purple.cgColor
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
        selectedCells.forEach({$0.layer.backgroundColor = UIColor.green.cgColor})
        print("Selected Word is : \(selectedWord)")
        selectedCells = []
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Grid : Touches began....")
    }
    
    func isCellSelected(cell : HexCell){
       
    }
    
    func getPositionForCell(cell : HexCell){
        
    }
    
    func findAdjacentCells(cell : HexCell) -> [HexCell]{
        
        return []
    }

}
