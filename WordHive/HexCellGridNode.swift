//
//  HexCellGridNode.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 12/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import UIKit
import SpriteKit

class HexCellGridNode: SKSpriteNode {
    
    func generateGridUsing(grid : HexCellGrid){
        grid.cells.forEach({
                self.addChild($0)
            })
    }
    

}
