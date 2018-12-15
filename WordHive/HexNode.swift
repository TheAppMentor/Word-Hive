//
//  HexView.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 12/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

extension SKNode{
    var center : CGPoint{
        get{
            let centX = frame.origin.x + frame.size.width/2.0
            let centY = frame.origin.y + frame.size.height/2.0
            return CGPoint(x: centX, y: centY)
        }
    }
}

public class HexNode : SKShapeNode{
    
    var touchEventDelegate : CellHilightDelegate? = nil
    let widthLine : CGFloat = 1.0
    let numSides = 6
    let cornerRadius : CGFloat = 3.0
    
    public init(frame : CGRect) {
        super.init()

        let hexPath = roundedPolygonPath(rect: frame, lineWidth: widthLine, sides: numSides , cornerRadius: 20.0, rotationOffset: 0.5).cgPath
        
        path = hexPath
        fillColor = UIColor(displayP3Red: (240.0/255.0), green: (170.0/255.0), blue: (23.0/255.0), alpha: 1.0)
        
        let label = SKLabelNode(text: "?")
        addChild(label)
        label.position = center
        label.zPosition = zPosition + 1
        label.fontColor = UIColor.black
        label.fontSize = 44.0
        label.fontName = "SanFranciscoDisplay-Heavy"
        label.color = UIColor.red
        //print(position)
        //print(label.position)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fillColor = UIColor.yellow
        print("Hex Node : Touches Began was called.")
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEventDelegate?.touchesMovedToLocation(touch: touches.first!)
        print("Hex Node : Touches Moved was called.")
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEventDelegate?.touchesEnded()
        print("Hex Node : Touches Ended was called.")
    }

    /*
    func setupHexagon(frame : CGRect, textValue : String) -> UIView{
        let hexView = HexView(frame: frame)
        let lineWidth : CGFloat = 1.0
        
        let path = roundedPolygonPath(rect: hexView.bounds, lineWidth: lineWidth, sides: 6, cornerRadius: 3, rotationOffset: 0.5)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.lineWidth = lineWidth
        mask.strokeColor = UIColor.red.cgColor
        mask.fillColor = UIColor.blue.cgColor
        hexView.layer.mask = mask
        hexView.layer.masksToBounds = true
        
        let border = CAShapeLayer()
        border.path = path.cgPath
        border.lineWidth = lineWidth
        border.strokeColor = UIColor.white.cgColor
        border.fillColor = UIColor.clear.cgColor
        hexView.layer.addSublayer(border)
        
        hexView.clipsToBounds = true
        
        hexView.isUserInteractionEnabled = true
        
        // Add Label
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        textLabel.text = textValue
        textLabel.textAlignment = .center
        
        hexView.addSubview(textLabel)
        //textLabel.center = self.center
        textLabel.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
        
        return hexView
    }
*/


    internal func roundedPolygonPath(rect: CGRect, lineWidth: CGFloat, sides: NSInteger, cornerRadius: CGFloat, rotationOffset: CGFloat = 0)
        -> UIBezierPath {
            let path = UIBezierPath()
            let theta: CGFloat = CGFloat(2.0 * .pi) / CGFloat(sides) // How much to turn at every corner
            let width = min(rect.size.width, rect.size.height)        // Width of the square
            
            let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)
            
            // Radius of the circle that encircles the polygon
            // Notice that the radius is adjusted for the corners, that way the largest outer
            // dimension of the resulting shape is always exactly the width - linewidth
            let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
            
            // Start drawing at a point, which by default is at the right hand edge
            // but can be offset
            var angle = CGFloat(rotationOffset)
            
            let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
            path.move(to: CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta)))
            
            for _ in 0 ..< sides {
                angle += theta
                
                let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
                let tip = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
                let start = CGPoint(x: corner.x + cornerRadius * cos(angle - theta), y: corner.y + cornerRadius * sin(angle - theta))
                let end = CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta))
                
                path.addLine(to: start)
                path.addQuadCurve(to: end, controlPoint: tip)
            }
            
            path.close()
            
            // Move the path to the correct origins
            let bounds = path.bounds
            let transform = CGAffineTransform(translationX: -bounds.origin.x + rect.origin.x + lineWidth / 2.0,
                                              y: -bounds.origin.y + rect.origin.y + lineWidth / 2.0)
            path.apply(transform)
            
            return path
    }
}
