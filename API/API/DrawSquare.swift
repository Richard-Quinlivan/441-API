//
//  DrawSquare.swift
//  API
//
//  Created by Richard Quinlivan on 3/19/21.
//

import UIKit
import CoreMotion

class DrawSquare: UIView {
    

    let leftEdge:Double = 0
    let rightEdge:Double = Double(UIScreen.main.bounds.size.width)
    let topEdge:Double = 0
    let bottomEdge:Double = Double(UIScreen.main.bounds.size.height)

    var drawX:Double = Double(UIScreen.main.bounds.size.width/2) - 20
    var drawY:Double = Double(UIScreen.main.bounds.size.height/2) - 20
    
    var dx:Double = 2
    var dy:Double = 2
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let color:UIColor = UIColor.blue
        let drect = CGRect(x:drawX, y:drawY, width:40, height:40)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        bpath.fill()
    }

    
    @objc func update(data :CMGyroData){
        drawX += data.rotationRate.x * 1
        drawY += data.rotationRate.y * 1
        if(drawX < leftEdge){
            drawX = leftEdge
        }
        else if(drawX + 40 > rightEdge){
            drawX = rightEdge
        }
        
        if(drawY < topEdge){
            drawX = topEdge
        }
        else if (drawY + 40 > bottomEdge){
            drawY = bottomEdge
        }
        
        setNeedsDisplay()
    }
}
