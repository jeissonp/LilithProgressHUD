//
//  LFProgressHUD.swift
//  Pods
//
//  Created by Liquicit on 4/08/16.
//
//

import UIKit

/** The class for displaying an LilithProgressHUD. */
public class LilithProgressHUD {
    /** Sets the opacity for the hud. The default is 0.5. */
    public static var opacity: CGFloat {
        get {
            return LilithProgressHUDConfig.sharedInstance.opacity
        }
        set {
            LilithProgressHUDConfig.sharedInstance.opacity = newValue
        }
    }
    
    /** Sets the size of the hud. The default is 70. */
    public static var size: CGFloat {
        get {
            return LilithProgressHUDConfig.sharedInstance.size
        }
        set {
            LilithProgressHUDConfig.sharedInstance.size = newValue
        }
    }
    
    /** Sets the corner radius of the hud. The default is 5. */
    public static var cornerRadius: CGFloat {
        get {
            return LilithProgressHUDConfig.sharedInstance.cornerRadius
        }
        set {
            LilithProgressHUDConfig.sharedInstance.cornerRadius = newValue
        }
    }
    
    /** Shows the HUD on a view. */
    public static func show(view: UIView?) {
        guard let view = view else {
            assert(false, "View was nil when trying to show the hud on it.")
        }
        
        let hud = ProgressHUD(frame: view.bounds)
        hud.center = view.center
        hud.alpha = 0
        view.addSubview(hud)
        
        UIView.animateWithDuration(0.5, animations: {
            hud.alpha = 1
        })
    }
    
    /** Hides all the huds for a view. */
    public static func hide(view: UIView?) {
        guard let view = view else {
            assert(false, "View was nil when trying to hide the hud on it.")
        }
        
        for subView in view.subviews {
            if subView.isKindOfClass(ProgressHUD) {
                UIView.animateWithDuration(0.5, animations: {
                    subView.alpha = 0
                    }, completion: { (finished) in
                        subView.removeFromSuperview()
                })
            }
        }
    }
}

/** The progressHUD class */
private class ProgressHUD: UIView {
    /** A required method. */
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    /** Init with a frame and setup th progressHUD with default values. */
    override init(frame: CGRect) {
        super.init(frame: frame)
        let hudFrame = CGRect(x: 0, y: 0, width: LilithProgressHUDConfig.sharedInstance.size, height: LilithProgressHUDConfig.sharedInstance.size)
        let hudView = UIView(frame: hudFrame)
        hudView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        hudView.backgroundColor = UIColor(white: 0, alpha: LilithProgressHUDConfig.sharedInstance.opacity)
        hudView.layer.cornerRadius = LilithProgressHUDConfig.sharedInstance.cornerRadius
        hudView.clipsToBounds = true
        let indicator = UIActivityIndicatorView(frame: hudView.bounds)
        hudView.addSubview(indicator)
        indicator.startAnimating()
        addSubview(hudView)
    }
}

/** A class for maintaining and configuring the LilithProgressHUD */
private class LilithProgressHUDConfig {
    /** The opacity of the hud. */
    var opacity: CGFloat = 0.5
    
    /** Size of the hud. */
    var size: CGFloat = 70
    
    /** Corner radius of the hud. */
    var cornerRadius: CGFloat = 5

    /** Shared instance for LilithProgressHUD. */
    static let sharedInstance = LilithProgressHUDConfig()
}