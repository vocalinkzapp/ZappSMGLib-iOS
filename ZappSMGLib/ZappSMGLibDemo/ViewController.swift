//
//  ViewController.swift
//  ZappSMGLibDemo
//
//  Created by Alexandru Maimescu on 12/9/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import UIKit
import ZappSMGLib

class ViewController: UIViewController {
    
    @IBOutlet weak var pbbaButton: PBBAButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pbbaButton.tapHandler = {
            button in
            
            print("Did tap button!")
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(10 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                
                button.stopAnimating()
                AppUtils.openZappCFIApp("12345", aptrId: "12345")
            }
        }
    }
}

