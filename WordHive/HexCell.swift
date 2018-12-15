//
//  HexCell.swift
//  Solver
//
//  Created by Moorthy, Prashanth on 5/1/17.
//  Copyright © 2017 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

//@IBDesignable

var tempArr : [String] =         ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"].reversed()

protocol GridCellRenderer {
    func nodeForCell(frame : CGRect, hexCell : HexCell) -> SKNode
}

protocol GridCell : Equatable, Codable {
    var gridPosition : GridPosition {get set}
    //var gridCellRender : GridCellRenderer {get}
    var isSelected : Bool {get set}
    var score : UInt {get}
    var textValue : String {get}
}

struct HexCell : GridCell{

    var gridPosition : GridPosition
    //var gridCellRender : GridCellRenderer
    
    var touchEventDelegate : CellHilightDelegate? = nil
    var textValue : String
    var isSelected : Bool = false
    var frame : CGRect

    var node : HexNode!
    
    var score : UInt {
        return WordScorer().scoreForString(inputString: textValue)
    }
    
    static func ==(lhs : HexCell, rhs : HexCell) -> Bool{
        return lhs.textValue == rhs.textValue
    }

    enum CodingKeys: String, CodingKey {
        case gridPosition
        case textValue
        case isSelected
        case frame
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        
        self.gridPosition = try container.decode(GridPosition.self, forKey: .gridPosition)
        self.textValue = try container.decode(String.self, forKey: .textValue)
        self.isSelected = try container.decode(Bool.self, forKey: .isSelected)
        self.frame = try container.decode(CGRect.self, forKey: .frame)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(gridPosition, forKey: .gridPosition)
        try container.encode(textValue, forKey: .textValue)
        try container.encode(isSelected, forKey: .isSelected)
        try container.encode(frame, forKey: .frame)
    }
   
    var debugDescription: String{
        //let desc = self.debugDescription + "; Position : " + self.position.debugDescription
        let desc = "HexCell => Text : \(textValue) => Postion : (\(gridPosition.row),\(gridPosition.col))"
        return desc
    }
    
    init(frame: CGRect, gridPosition : GridPosition, textValue : String) {
        self.frame = frame
        self.gridPosition = gridPosition
        self.textValue = textValue
        self.node = HexNode(frame: self.frame)
    }
}
