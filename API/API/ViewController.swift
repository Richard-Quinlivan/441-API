//
//  ViewController.swift
//  API
//
//  Created by Richard Quinlivan on 3/15/21.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var drawSquare : DrawSquare!
    
    var motionManager: CMMotionManager!
    var data : CMGyroData!

    var ranOnce:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager = CMMotionManager()
        motionManager.gyroUpdateInterval = 0.5
        motionManager.startGyroUpdates(to: OperationQueue.current!) {(dataIn, error) in
            if let actualData = dataIn{
                self.data = actualData
            }
            if(!self.ranOnce){
                let displayLink = CADisplayLink(target: self, selector: #selector(self.update))
                displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
                self.ranOnce = true
            }
        }
    }
    
    @objc func update(){
        drawSquare.update(data: data)
    }
}

