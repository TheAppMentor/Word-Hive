//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit
import WordHiveFramework

class GameScene: SKScene {
    
    private var hexNode : HexNode!
    private var hexGrid : HexCellGrid!
    
    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later

        hexGrid = HexCellGrid.init(frame: CGRect(x: 0, y: 0, width: 375.0, height: 375.0))
        addChild(hexGrid.gridNode)
        
//        hexNode = HexNode(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 200))
//        addChild(hexNode)
//        hexNode.children
//        hexNode.position = position
    }
    
    func changePath() {
      print("Change Path Got Called ..... ")
        hexNode.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 50.0, height: 50.0)).cgPath
    }
    
    @objc static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        //guard let n = spinnyNode.copy() as? SKShapeNode else { return }
        
        print("I Got a Touch Down... ")
        nodes(at: pos).contains(hexNode)
        hexNode.fillColor = UIColor.green
        //hexNode.run(SKAction.perform(Selector(("changePath")), onTarget: self))
        let sourcePositions: [float2] = [
            float2(0, 1),   float2(0.5, 1),   float2(1, 1),
            float2(0, 0.5), float2(0.5, 0.5), float2(1, 0.5),
            float2(0, 0),   float2(0.5, 0),   float2(1, 0)
        ]
        
        let destinationPositions: [float2] = [
            float2(-0.25, 10.0), float2(0.5, 1.75), float2(1.25, 1.5),
            float2(0.25, 10.5),   float2(0.5, 0.5),   float2(0.75, 0.5),
            float2(-0.25, -10.5),  float2(0.5, -13.175),  float2(1.25, -0.5)
        ]
        let warpGeometryGrid = SKWarpGeometryGrid(columns: 2,
                                                  rows: 2,
                                                  sourcePositions: sourcePositions,
                                                  destinationPositions: destinationPositions)
        
//        let warpGeometryGridNoWarp = SKWarpGeometryGrid(columns: 2, rows: 2)
//        hexNode.warpGeometry = warpGeometryGridNoWarp
//        
//        let warpAction = SKAction.warp(to: warpGeometryGrid,duration: 1.5)
//        //hexNode.run(warpAction!)
//        //hexNode!.run(SKAction.repeatForever(SKAction.fadeAlpha(to: 0.1, duration: 3.0)))
       
        let fadeIn = SKAction.fadeAlpha(to: 0.1, duration: 1.0)
        let fadeOut = SKAction.fadeAlpha(to: 1.0, duration: 1.0)

//        let seq = SKAction.sequence([fadeIn,fadeOut,warpAction!])
//        let seq = SKAction.sequence([warpAction!])

        //hexNode!.run(SKAction.repeatForever(seq))

        //let changePathAction = SKAction.animate(withWarps: [SKWarpGeometry], times: <#T##[NSNumber]#>)
        
        //hexNode.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 50.0, height: 50.0)).cgPath
    
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        //guard let n = self.spinnyNode.copy() as? SKShapeNode else { return }
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        //guard let n = spinnyNode.copy() as? SKShapeNode else { return }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self))
           // backgroundColor = UIColor.red
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    scene.backgroundColor = UIColor.white
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true
