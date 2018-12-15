//
//  HexCellRendere.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 12/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

struct HexCellRenderer : GridCellRenderer {
    
    func nodeForCell(frame : CGRect, hexCell : HexCell) -> SKNode {
        let hexNode = HexNode(frame: frame)
        return hexNode
    }
}
