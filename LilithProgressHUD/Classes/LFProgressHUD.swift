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
    
    /** Shared instance */
    static let sharedInstance = LilithProgressHUD()
    
    /** The main window that is used to display LilithProgressHUD */
    private let window:UIWindow!
    
    /** The previous window displayed */
    private var previousWindow:UIWindow?
    
    /** Configure default values for LilithProgressHUD */
    private init() {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0)
        vc.view.addSubview(ProgressHUD(frame: vc.view.bounds))
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = UIWindowLevelAlert
        window.rootViewController = vc
        window.alpha = 0
        
        previousWindow = UIWindow(frame: UIScreen.main.bounds)
        if let window = UIApplication.shared.delegate?.window {
            previousWindow = window
        }
    }
    
    /**The opacity for the hud. The default is 0.5. */
    public static var opacity: CGFloat {
        get {
            return LilithProgressHUDConfig.sharedInstance.opacity
        }
        set {
            LilithProgressHUDConfig.sharedInstance.opacity = newValue
        }
    }
    
    /** The size of the hud. The default is 70. */
    public static var size: CGFloat {
        get {
            return LilithProgressHUDConfig.sharedInstance.size
        }
        set {
            LilithProgressHUDConfig.sharedInstance.size = newValue
        }
    }
    
    /** The corner radius of the hud. The default is 5. */
    public static var cornerRadius: CGFloat {
        get {
            return LilithProgressHUDConfig.sharedInstance.cornerRadius
        }
        set {
            LilithProgressHUDConfig.sharedInstance.cornerRadius = newValue
        }
    }
    
    /** The fade in and out time of the hud. The default is 0.5 */
    public static var fadeTime: TimeInterval {
        get {
            return LilithProgressHUDConfig.sharedInstance.fadeTime
        }
        set {
            LilithProgressHUDConfig.sharedInstance.fadeTime = newValue
        }
    }
    
    /** Shows the HUD. */
    public class func show() {
        guard let previousWindow = UIApplication.shared.delegate?.window else {
            assert(false, "Couldn't find main window.")
            return
        }
        
        LilithProgressHUD.sharedInstance.previousWindow = previousWindow
        LilithProgressHUD.sharedInstance.window.makeKeyAndVisible()
        
        for view in LilithProgressHUD.sharedInstance.window.rootViewController!.view.subviews {
            if view is ProgressHUD {
                (view as! ProgressHUD).startAnimating()
            }
        }
        
        UIView.animate(withDuration: LilithProgressHUDConfig.sharedInstance.fadeTime) {
            LilithProgressHUD.sharedInstance.window.alpha = 1
        }
    }
    
    /** Hides the HUD. */
    public class func hide() {
        UIView.animate(withDuration: LilithProgressHUDConfig.sharedInstance.fadeTime, animations: {
            LilithProgressHUD.sharedInstance.window.alpha = 0
        }) { (Bool) in
            LilithProgressHUD.sharedInstance.previousWindow?.makeKeyAndVisible()
        }
    }
    
    /** Shows the HUD on a view. */
    public class func show(view: UIView?) {
        guard let view = view else {
            assert(false, "View was nil when trying to show the hud on it.")
            return
        }
        
        let hud = ProgressHUD(frame: view.bounds)
        view.addSubview(hud)
        
        hud.startAnimating()
    }
    
    /** Hides all the huds for a view. */
    public class func hide(view: UIView?) {
        guard let view = view else {
            assert(false, "View was nil when trying to hide the hud on it.")
            return
        }
        
        for subView in view.subviews {
            if subView is ProgressHUD {
                (subView as! ProgressHUD).endAnimating()
            }
        }
    }
}

/** The progressHUD class */
private class ProgressHUD: UIView {
    /** A required method. */
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    /** The indicator view */
    var indicator:UIActivityIndicatorView!
    
    /** The hud view */
    var hudView:UIView!
    
    /** Init with a frame and setup th progressHUD with default values. */
    override init(frame: CGRect) {
        super.init(frame: frame)
        let hudFrame = CGRect(x: 0, y: 0, width: LilithProgressHUDConfig.sharedInstance.size, height: LilithProgressHUDConfig.sharedInstance.size)
        hudView = UIView(frame: hudFrame)
        hudView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        hudView.backgroundColor = UIColor(white: 0, alpha: LilithProgressHUDConfig.sharedInstance.opacity)
        hudView.layer.cornerRadius = LilithProgressHUDConfig.sharedInstance.cornerRadius
        hudView.clipsToBounds = true
        indicator = UIActivityIndicatorView(frame: hudView.bounds)
        hudView.addSubview(indicator)
        addSubview(hudView)
    }
    
    /** Starts animating the HUD */
    func startAnimating() {
        indicator.startAnimating()
        UIView.animate(withDuration: LilithProgressHUDConfig.sharedInstance.fadeTime, animations: {
            self.hudView.alpha = 1
        })
    }
    
    /** Finishes animating the HUD */
    func endAnimating() {
        UIView.animate(withDuration: LilithProgressHUDConfig.sharedInstance.fadeTime, animations: {
            self.hudView.alpha = 0
            }, completion: { (finished) in
                self.removeFromSuperview()
        })
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
    
    /** The fade in and fade out time of the hud. */
    var fadeTime: TimeInterval = 0.5
    
    /** Shared instance for LilithProgressHUD. */
    static let sharedInstance = LilithProgressHUDConfig()
}
