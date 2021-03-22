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
    let middle:Double = Double(UIScreen.main.bounds.size.width) / 2
    var drawX:Double = 5
    var drawY:Double = Double(UIScreen.main.bounds.size.height - 20)
    
    var dx:Double = 2
    var dy:Double = 10
    
    var movement:Double = 0
    var canMove:Bool = true
    var gameOver:Bool = false
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let color1:UIColor = UIColor.blue
        let drect = CGRect(x:drawX, y:drawY, width:40, height:40)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)

        color1.set()
        bpath.stroke()
        bpath.fill()
        
        
        let color2:UIColor = UIColor.red
        let obstacle = CGRect(x:middle, y:bottomEdge - 40, width:10, height:40)
        let bpath2:UIBezierPath = UIBezierPath(rect: obstacle)

        color2.set()
        bpath2.stroke()
        bpath2.fill()
    }

    
    @objc func update(data :CMAccelerometerData){

        
       
        movement = abs(data.acceleration.x) + abs(data.acceleration.y) + abs(data.acceleration.z)
        if(movement > 1.6 && canMove){
            drawY += -(movement * 2)
        }
        else{
            drawY += dy
        }
        drawX += dx
        
        
        if(drawX < leftEdge || drawX + 40 > rightEdge){
            dx = -dx
        }
        if(drawY < bottomEdge - 200){
            drawY = bottomEdge - 200
            canMove = false
        }
        else if (drawY > bottomEdge - 40){
            drawY = bottomEdge - 40
            canMove = true
        }
        
        if(drawX < middle + 10 && drawX > middle - 10 - 40){
            if(drawY + 40  > bottomEdge - 10){
                gameOver = true
            }
        }
        setNeedsDisplay()
    }
    
    func resetPosition(){
        drawX = 5
        drawY = Double(UIScreen.main.bounds.size.height - 40)
        gameOver = false
    }
}
