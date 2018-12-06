//
//  HexCell.swift
//  Solver
//
//  Created by Moorthy, Prashanth on 5/1/17.
//  Copyright © 2017 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class HexCell : UIView{

    var touchEventDelegate : CellHilightDelegate? = nil
    
    var textValue : String!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupHexagon()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHexagon()
        clipsToBounds = true
        
        isUserInteractionEnabled = true
        
        // Add Label
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        textValue = RandomAlphabetProvider.shared.randomAlphabet
        textLabel.text = textValue
        textLabel.textAlignment = .center
        
        addSubview(textLabel)
        //textLabel.center = self.center
        textLabel.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
    }
    
    
    
    func setupHexagon() {
        let lineWidth : CGFloat = 1.0
        
        let path = roundedPolygonPath(rect: bounds, lineWidth: lineWidth, sides: 6, cornerRadius: 3, rotationOffset: 0.5)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.lineWidth = lineWidth
        mask.strokeColor = UIColor.red.cgColor
        mask.fillColor = UIColor.blue.cgColor
        layer.mask = mask
        layer.masksToBounds = true
        
        let border = CAShapeLayer()
        border.path = path.cgPath
        border.lineWidth = lineWidth
        border.strokeColor = UIColor.white.cgColor
        border.fillColor = UIColor.clear.cgColor
        layer.addSublayer(border)
        
    }
    
    override func prepareForInterfaceBuilder() {
        setupHexagon()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        layer.backgroundColor = UIColor.yellow.cgColor
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEventDelegate?.touchesMovedToLocation(touch: touches.first!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEventDelegate?.touchesEnded()
    }
    
    
//    internal static func setupHexagonImageView(imageView: UIImageView) {
//        let lineWidth: CGFloat = 5
//        let path = Utils.roundedPolygonPath(imageView.bounds, lineWidth: lineWidth, sides: 6, cornerRadius: 10, rotationOffset: CGFloat(M_PI / 2.0))
//        
//        let mask = CAShapeLayer()
//        mask.path = path.CGPath
//        mask.lineWidth = lineWidth
//        mask.strokeColor = UIColor.clearColor().CGColor
//        mask.fillColor = UIColor.whiteColor().CGColor
//        imageView.layer.mask = mask
//        
//        let border = CAShapeLayer()
//        border.path = path.CGPath
//        border.lineWidth = lineWidth
//        border.strokeColor = UIColor.whiteColor().CGColor
//        border.fillColor = UIColor.clearColor().CGColor
//        imageView.layer.addSublayer(border)
//    }
//    
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
