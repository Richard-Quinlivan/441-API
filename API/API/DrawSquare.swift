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

    var drawX:Double = 5    //Double(UIScreen.main.bounds.size.width/2) - 20
    var drawY:Double = Double(UIScreen.main.bounds.size.height - 20)
    //Double(UIScreen.main.bounds.size.height/2) - 20
    
    var dx:Double = 2
    var dy:Double = 10
    
    var movement:Double = 0
    
    
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

    
    @objc func update(data :CMAccelerometerData){

        
       
        movement = abs(data.acceleration.x) + abs(data.acceleration.y) + abs(data.acceleration.z)
        if(movement > 1.6){
            drawY += -(movement * 2)
        }
        else{
            drawY += dy
        }
        drawX += dx
        
        
        if(drawX < leftEdge || drawX + 40 > rightEdge){
            dx = -dx
        }
        if(drawY < topEdge - 100){
            drawY = topEdge - 100
        }
        else if (drawY > bottomEdge - 50){
            drawY = bottomEdge - 50
        }
        setNeedsDisplay()
    }
}
