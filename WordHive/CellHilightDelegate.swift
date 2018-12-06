//
//  CellHilightDelegate.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 5/1/17.
//  Copyright © 2017 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import UIKit


protocol CellHilightDelegate {
    func touchesMovedToLocation(touch : UITouch)
    func touchesEnded()
}
