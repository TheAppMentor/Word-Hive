//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

extension SKAction {
    
    static func multipleColorTransitionAction(colors:[SKColor], duration:Double) -> SKAction {
        guard colors.count > 1 else { return SKAction.colorize(withColorBlendFactor: 1, duration: 0) }
        var colorActions:[SKAction] = []
        for i in 1..<colors.count {
            colorActions.append( colorTransitionAction(fromColor: colors[i-1] , toColor: colors[i], duration: duration/Double(colors.count)) )
        }
        colorActions.append(colorTransitionAction(fromColor: colors.last!, toColor: colors.first!, duration: duration/Double(colors.count)))
        return SKAction.sequence(colorActions)
    }
    
    static func colorTransitionAction(fromColor : SKColor, toColor : SKColor, duration : Double = 0.4) -> SKAction {
        func lerp(_ a : CGFloat, b : CGFloat, fraction : CGFloat) -> CGFloat { return (b-a) * fraction + a }
        var frgba:[CGFloat] = [0,0,0,0]
        var trgba:[CGFloat] = [0,0,0,0]
        fromColor.getRed(&frgba[0], green: &frgba[1], blue: &frgba[2], alpha: &frgba[3])
        toColor.getRed(&trgba[0], green: &trgba[1], blue: &trgba[2], alpha: &trgba[3])
        
        return SKAction.customAction(withDuration: duration, actionBlock: { (node : SKNode!, elapsedTime : CGFloat) -> Void in
            let fraction = CGFloat(elapsedTime / CGFloat(duration))
            let transColor = UIColor(red:   lerp(frgba[0], b: trgba[0], fraction: fraction),
                                     green: lerp(frgba[1], b: trgba[1], fraction: fraction),
                                     blue:  lerp(frgba[2], b: trgba[2], fraction: fraction),
                                     alpha: lerp(frgba[3], b: trgba[3], fraction: fraction))
            (node as! SKShapeNode).fillColor = transColor
        })
    }
}

class GameScene: SKScene {
    
    private var label : SKLabelNode!
    private var spinnyNode : SKShapeNode!
    
    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later

        // Create shape node to use during mouse interaction
        //let w = (size.width + size.height) * 0.05
        
        //spinnyNode = SKShapeNode(rectOf: CGSize(width: w, height: w), cornerRadius: w * 0.3)i
        
        spinnyNode = SKShapeNode(rectOf: CGSize(width:200,height:200))
        spinnyNode.lineWidth = 2.5
        
//        let fadeAndRemove = SKAction.sequence([.wait(forDuration: 0.5),
//                                               .fadeOut(withDuration: 0.5),
//                                               .removeFromParent()])

        let changeShape = SKAction.run {
//            self.spinnyNode.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100)).cgPath;
            self.spinnyNode.fillColor = UIColor.red
        }
        
        let theRainbow:[SKColor] = [.red,.orange,.yellow,.green,.cyan,.blue,.purple,.magenta]
        let rainbowSequenceAction = SKAction.multipleColorTransitionAction(colors: theRainbow, duration: 10)
        spinnyNode.run(SKAction.repeatForever(rainbowSequenceAction))
        
        //spinnyNode.run(.repeatForever(.rotate(byAngle: CGFloat(Double.pi), duration: 0.5)))
        //spinnyNode.run(changeShape)
    }
    
    @objc static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        guard let n = spinnyNode.copy() as? SKShapeNode else { return }
        
        n.position = pos
        n.strokeColor = SKColor.green
        addChild(n)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
//        guard let n = self.spinnyNode.copy() as? SKShapeNode else { return }
//
//        n.position = pos
//        n.strokeColor = SKColor.blue
//        addChild(n)
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        guard let n = spinnyNode.copy() as? SKShapeNode else { return }
//
//        n.position = pos
//        n.strokeColor = SKColor.red
//        addChild(n)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
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
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
