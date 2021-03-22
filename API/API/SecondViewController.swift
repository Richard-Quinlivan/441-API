//
//  SecondViewController.swift
//  API
//
//  Created by Richard Quinlivan on 3/22/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    var firstViewController : ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination is ViewController){
            firstViewController?.drawSquare.resetPosition()
        }
    }
    

}
