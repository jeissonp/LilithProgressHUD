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
    /** Shows the HUD on a view. */
    public static func show(view:UIView?) {
        if view != nil {
            let hud = progressHUD(frame: view!.bounds)
            hud.center = view!.center
            hud.alpha = 0
            view!.addSubview(hud)
            
            hud.startAnimating()
            UIView.animateWithDuration(0.5, animations: {
                hud.alpha = 1
            })
        }else{
            print("View was nil when trying to show the hud on it.")
        }
    }
    
    /** Hides all the huds for a view. */
    public static func hide(view:UIView?) {
        if view != nil {
            for subView in view!.subviews {
                if subView.isKindOfClass(progressHUD) {
                    UIView.animateWithDuration(0.5, animations: {
                        subView.alpha = 0
                        }, completion: { (Bool) in
                            subView.removeFromSuperview()
                    })
                }
            }
        }else{
            print("View was nil when trying to hide the huds on it.")
        }
    }
    
    /** Sets the opacity for the hud. The default is 0.5. */
    public static func opacity(opacity:CGFloat) {
        LilithProgressHUDConfig.sharedInstance.opacity = opacity
    }
    
    /** Sets the size of the hud. The default is 80. */
    public static func size(size:CGFloat) {
        LilithProgressHUDConfig.sharedInstance.size = size
    }
    
    /** Sets the corner radius of the hud. The default is 5. */
    public static func cornerRadius(cornerRadius:CGFloat) {
        LilithProgressHUDConfig.sharedInstance.cornerRadius = cornerRadius
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
        let hudFrame = CGRect(x: 0, y: 0, width: LilithProgressHUDConfig.sharedInstance.size, height: LilithProgressHUDConfig.sharedInstance.size)
        let hudView = UIView(frame: hudFrame)
        hudView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        hudView.backgroundColor = UIColor(white: 0, alpha: LilithProgressHUDConfig.sharedInstance.opacity)
        hudView.layer.cornerRadius = LilithProgressHUDConfig.sharedInstance.cornerRadius
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

/** A class for maintaining and configuring the LilithProgressHUD */
private class LilithProgressHUDConfig : NSObject {
    /** The opacity of the hud. */
    var opacity:CGFloat! = 0.5
    
    /** Size of the hud. */
    var size:CGFloat! = 80
    
    /** Corner radius of the hud. */
    var cornerRadius:CGFloat! = 5
    
    /** Override the init, to use the singleton. */
    override private init() {
        super.init()
    }
    
    /** Shared instance for LilithProgressHUD. */
    static let sharedInstance = LilithProgressHUDConfig()
}