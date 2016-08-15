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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: view.bounds)
        button.setTitle("HELLO", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.setTitleColor(UIColor.darkGrayColor(), forState: .Highlighted)
        button.addTarget(self, action: #selector(ViewController.hello), forControlEvents: .TouchUpInside)
        view.addSubview(button)
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            LilithProgressHUD.show(self.view)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(9 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            LilithProgressHUD.hide(self.view)
        }
        
    }
    
    func hello() {
        print("hello")
    }

    
}

