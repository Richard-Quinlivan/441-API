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
    var data : CMAccelerometerData!

    var ranOnce:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager = CMMotionManager()
        motionManager.gyroUpdateInterval = 0.5
        motionManager.accelerometerUpdateInterval = 0.5
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {
            (dataIn, error) in
            if let actualData = dataIn{
                self.data = actualData
            }
//            if(!self.ranOnce){
                let displayLink = CADisplayLink(target: self, selector: #selector(self.update))
                displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
//                self.ranOnce = true
//            }
        }
    }
    
    @objc func update(){
        drawSquare.update(data: data)
        if(drawSquare.gameOver && !ranOnce){
            GameOver()
        }
    }
    
    func GameOver(){
        drawSquare.resetPosition()
        ranOnce = true
        performSegue(withIdentifier: "segue1", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination is SecondViewController){
            let vc = segue.destination as? SecondViewController
            vc?.firstViewController = self
        }
    }
}

