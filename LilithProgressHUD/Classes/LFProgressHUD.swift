//
//  LFProgressHUD.swift
//  Pods
//
//  Created by Liquicit on 4/08/16.
//
//

import UIKit

/** The class for displaying an LFProgressHUD. */
public class LilithProgressHUD {
    /** Shows the HUD on a view. */
    public static func show(view:UIView) {
        let hud = progressHUD(frame: view.bounds)
        hud.center = view.center
        hud.alpha = 0
        view.addSubview(hud)
        
        hud.startAnimating()
        UIView.animateWithDuration(0.5, animations: {
            hud.alpha = 1
        })
    }
    
    /** Hides all the huds for a view. */
    public static func hide(view:UIView) {
        for subView in view.subviews {
            if subView.isKindOfClass(progressHUD) {
                UIView.animateWithDuration(0.5, animations: {
                    subView.alpha = 0
                    }, completion: { (Bool) in
                        subView.removeFromSuperview()
                })
            }
        }
    }
}

/** The progressHUD class */
private class progressHUD : UIView {
    /** A required method. */
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    /** The activity indicator */
    var indicator:UIActivityIndicatorView!
    
    /** Init with a frame and setup th progressHUD with default values. */
    override init(frame: CGRect) {
        super.init(frame: frame)
        let hudFrame = CGRect(x: 0, y: 0, width: 80, height: 80)
        let hudView = UIView(frame: hudFrame)
        hudView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        hudView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        hudView.layer.cornerRadius = 5
        hudView.clipsToBounds = true
        indicator = UIActivityIndicatorView(frame: hudView.bounds)
        hudView.addSubview(indicator)
        addSubview(hudView)
    }
    
    /** Start animating the progressHUD*/
    func startAnimating() {
        indicator.startAnimating()
    }
}