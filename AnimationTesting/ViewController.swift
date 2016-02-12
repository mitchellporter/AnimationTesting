//
//  ViewController.swift
//  AnimationTesting
//
//  Created by Mitchell Porter on 2/11/16.
//  Copyright © 2016 Mentor Ventures, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redBox: UIView!
    var originalY = CGFloat(0.0)

    @IBOutlet weak var redBoxCenterYContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "firstAnimation", userInfo: nil, repeats: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print(redBox.frame)
    }
    
    func firstAnimation() {
        self.redBoxCenterYContraint.constant += CGFloat(100)
        UIView.animateWithDuration(1.0, delay: 0.0, options: [], animations: { () -> Void in
            self.redBox.superview?.layoutIfNeeded()
            
            }) { (complete) -> Void in
                self.secondAnimation()
        }
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: [], animations: { () -> Void in
            let value = CGFloat(M_PI)
            self.redBox.transform = CGAffineTransformMakeRotation(value)

            }) { (complete) -> Void in
        }
    }
    
    func secondAnimation() {
        self.redBoxCenterYContraint.constant = self.originalY
        UIView.animateWithDuration(5.0, delay: 0.0, options: [], animations: { () -> Void in
            self.redBox.superview?.layoutIfNeeded()
            }) { (complete) -> Void in
                print(self.redBox.frame)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
