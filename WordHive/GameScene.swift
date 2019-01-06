//
//  GameScene.swift
//  simtetest
//
//  Created by Moorthy, Prashanth on 05/01/19.
//  Copyright © 2019 Moorthy, Prashanth. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var hexGrid : HexCellGrid!

    override func didMove(to view: SKView) {
        hexGrid = HexCellGrid.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width))
        addChild(hexGrid.gridNode)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
