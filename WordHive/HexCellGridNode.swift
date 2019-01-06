//
//  HexCellGridNode.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 12/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import UIKit
import SpriteKit

enum HexGridCellNodeError : Error {
    case missing_Hex_Node_for_Hex_Cell
    case wrongPostionForHexCellNode
}

public class HexCellGridNode: SKSpriteNode {
    
    convenience init?(size : CGSize, grid : HexCellGrid) throws {
        self.init(color: UIColor.blue, size: size)
        do {
            try generateGridUsing(grid: grid)
        }catch {
            return nil
        }
    }
    
    func generateGridUsing(grid : HexCellGrid) throws {
        print("Staring to generate Nodes")
        
        let refNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 5.0, height: 5.0))
        addChild(refNode)
        
        try grid.cells.forEach({
            guard let hexNode = $0.node else {
                throw HexGridCellNodeError.missing_Hex_Node_for_Hex_Cell
            }
           
//            guard let nodePosition = getCoordinatesForNode(gridCell: hexNode) else {
//                throw HexGridCellNodeError.wrongPostionForHexCellNode
//            }
            
//            hexNode.position = nodePosition
            addChild(hexNode)
            print("Adding Hex Node ... ! \(hexNode)")
        })
    }
}

extension HexCellGridNode {
    
    internal func getCoordinatesForNode(gridCell : HexCellGrid) -> CGPoint?{
        
       return nil
    }
    
}
