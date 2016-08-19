//
//  ViewController.swift
//  LFProgressHUD
//
//  Created by joshuaarnold on 08/04/2016.
//  Copyright (c) 2016 joshuaarnold. All rights reserved.
//

import UIKit
import LilithProgressHUD

class ViewController: UIViewController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: view.bounds)
        label.textAlignment = .Center
        label.text = "🍉"
        view.addSubview(label)
        
        LilithProgressHUD.opacity = 0.75
        LilithProgressHUD.size = 60
        LilithProgressHUD.cornerRadius = 5
        LilithProgressHUD.fadeTime = 1
        
        //Show hud after delay
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            LilithProgressHUD.show()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        //Hide the hud after delay
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(9 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            LilithProgressHUD.hide()
        }
        
    }
    
}

