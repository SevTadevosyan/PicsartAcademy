//
//  ReusableFunctions.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 15.06.22.
//

import Foundation
import UIKit

class ReusableFunctions {
    static let shared = ReusableFunctions()
    init(){}
    
    static var selectedVC = 0
    func OpenUrl(with url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
    
    var languageBundle : Bundle?
    func language() -> Bundle {
        let languageCode = UserDefaults.standard
        if UserDefaults.standard.value(forKey: "language") != nil {
            let language = languageCode.string(forKey: "language")!
            if let path  = Bundle.main.path(forResource: language, ofType: "lproj") {
                languageBundle =  Bundle(path: path)
                return languageBundle ?? Bundle()
            } else {
                languageBundle = Bundle(path: Bundle.main.path(forResource: "en", ofType: "lproj")!)
            }
        }
        else {
            languageCode.set("en", forKey: "language")
            languageCode.synchronize()
            let language = languageCode.string(forKey: "language")!
            if let path  = Bundle.main.path(forResource: language, ofType: "lproj") {
                languageBundle =  Bundle(path: path)
                languageBundle =  Bundle(path: path)
                return languageBundle ?? Bundle()
            } else {
                languageBundle = Bundle(path: Bundle.main.path(forResource: "en", ofType: "lproj")!)
            }
        }
        return Bundle()
    }
    
    
    func animateScaleIn(_ view: UIView, desiredView: UIView) {
        let backgroundView = view
        backgroundView.addSubview(desiredView)
        desiredView.center = backgroundView.center
        desiredView.isHidden = false
        
        desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        desiredView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
            desiredView.transform = CGAffineTransform.identity
        }
    }
    
    
    func animateScaleOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            desiredView.alpha = 0
        }, completion: { (success: Bool) in
            desiredView.removeFromSuperview()
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            
        }, completion: { _ in
            
        })
    }
    
    func changeLanguageSegmentValue(language: UISegmentedControl) {
        if language.selectedSegmentIndex == 0 {
            UserDefaults.standard.set("en", forKey: "language")
        } else if language.selectedSegmentIndex == 1 {
            UserDefaults.standard.set("hy", forKey: "language")
        }
    }
    func changeAppearanceSegmentValue(appearance: UISegmentedControl) {
        UserDefaults.standard.set(appearance.selectedSegmentIndex, forKey: "isLight")
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        
        if appearance.selectedSegmentIndex == 0 {
            keyWindow?.overrideUserInterfaceStyle = .dark
            
        } else {
            keyWindow?.overrideUserInterfaceStyle = .light
        }
    }
    func setAppearanceSegmentValue(_ vc: UIViewController, appearance: UISegmentedControl) {
        if vc.traitCollection.userInterfaceStyle == .light {
            appearance.selectedSegmentIndex = 1
        } else {
            appearance.selectedSegmentIndex = 0
        }
    }
    func unhideView(view: UIView) {
            UIView.transition(with: view, duration: 0.5, options: .curveEaseIn, animations: {
                view.isHidden = false
            })
    }
    func hideView(view: UIView) {
            UIView.transition(with: view, duration: 0.5, options: .curveEaseIn, animations: {
                view.isHidden = true
            })
    }
    
    func configureImages(f: UIImageView, o1: UIImageView, o2: UIImageView, o3: UIImageView) {
        f.image = UIImage(systemName: "circle.inset.filled")
        f.layer.opacity = 1
        o1.image = UIImage(systemName: "circle.fill")
        o1.layer.opacity = 0.5
        o2.image = UIImage(systemName: "circle.fill")
        o2.layer.opacity = 0.5
        o3.image = UIImage(systemName: "circle.fill")
        o3.layer.opacity = 0.5
    }
    func configureImages(f: UIImageView, s: UIImageView, o1: UIImageView, o2: UIImageView) {
        f.image = UIImage(systemName: "circle.inset.filled")
        f.layer.opacity = 1
        s.image = UIImage(systemName: "circle.inset.filled")
        s.layer.opacity = 1
        o1.image = UIImage(systemName: "circle.fill")
        o1.layer.opacity = 0.5
        o2.image = UIImage(systemName: "circle.fill")
        o2.layer.opacity = 0.5
    }
    func configureImages(f: UIImageView, s: UIImageView, t: UIImageView, o1: UIImageView) {
        f.image = UIImage(systemName: "circle.inset.filled")
        f.layer.opacity = 1
        s.image = UIImage(systemName: "circle.inset.filled")
        s.layer.opacity = 1
        t.image = UIImage(systemName: "circle.inset.filled")
        t.layer.opacity = 1
        o1.image = UIImage(systemName: "circle.fill")
        o1.layer.opacity = 0.5
    }
    func configureImages(f: UIImageView, s: UIImageView, t: UIImageView, fth: UIImageView) {
        f.image = UIImage(systemName: "circle.inset.filled")
        f.layer.opacity = 1
        s.image = UIImage(systemName: "circle.inset.filled")
        s.layer.opacity = 1
        t.image = UIImage(systemName: "circle.inset.filled")
        t.layer.opacity = 1
        fth.image = UIImage(systemName: "circle.inset.filled")
        fth.layer.opacity = 1
    }
    func changeHideState(f: UILabel, o1: UILabel, o2: UILabel, o3: UILabel) {
        f.isHidden = false
        o1.isHidden = true
        o2.isHidden = true
        o3.isHidden = true
    }
    var minusImage = UIImage(systemName: "minus")
    var plusImage = UIImage(systemName: "plus")
    func setPlusAndMinusImage( m: UIButton, p1: UIButton, p2: UIButton) {
        m.setImage(minusImage, for: .normal)
        p1.setImage(plusImage, for: .normal)
        p2.setImage(plusImage, for: .normal)
        
    }
    func setPlusImageExceptFor(b1: UIButton, b2: UIButton) {
        b1.setImage(plusImage, for: .normal)
        b2.setImage(plusImage, for: .normal)
    }
    func showMenu(vc: UIViewController) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        vc.view.frame.origin.x = vc.view.frame.width - 390
        }) { (finished) in
            
        }
    }
    func hideMenu(vc: UIViewController) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        vc.view.frame.origin.x = 0
        }) { (finished) in
            
        }
    }
}
