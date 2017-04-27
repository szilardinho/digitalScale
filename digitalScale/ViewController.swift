//
//  ViewController.swift
//  digitalScale
//
//  Created by Szi Gabor on 4/26/17.
//  Copyright © 2017 Szi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        forceLabel.text = "385+ grams"
                    } else {
                        let force = touch.force/touch.maximumPossibleForce
                        let grams = force * 385
                        let roundGrams = Int(grams)
                        forceLabel.text = "\(roundGrams) grams"
                    }
                }
            }
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        forceLabel.text = "0 gram"
    }

    
    
    

}

