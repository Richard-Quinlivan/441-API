//
//  ViewController.swift
//  API
//
//  Created by Richard Quinlivan on 3/15/21.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager: CMMotionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager = CMMotionManager()
        motionManager.gyroUpdateInterval = 0.5
        motionManager.startGyroUpdates(to: OperationQueue.current!) {(data, error) in
            if let actualData = data{
                print(actualData)
            }
            
        }
    }


}

