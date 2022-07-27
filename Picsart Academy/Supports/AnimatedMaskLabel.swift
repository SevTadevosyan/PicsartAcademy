//
//  AnimatedMaskLabel.swift
//  AnimatedMaskLabel
//

import UIKit
import QuartzCore

@IBDesignable class AnimatedMaskLabel: UIView {
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        let colors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemTeal.cgColor,
            UIColor.blue.cgColor
        ]
        gradientLayer.colors = colors

        let locations = [
            0.25,
            0.5,
            0.75
        ]
        gradientLayer.locations = locations as [NSNumber]
        return gradientLayer
    }()

    lazy var textAttributes : [NSAttributedString.Key: AnyObject] = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        var fontSize = 10
        var fontName = "Arial-BoldMT"
        var boundsWidth = UIScreen.main.bounds.width
            switch boundsWidth {
            case 320.0:
                fontSize = 22
            case 375.0:
                fontSize = 24
            case 390.0, 414.0, 428.0:
                fontSize = 25
            case 476.0:
                fontSize = 30
            default:
                fontSize = 10
            }
        if self.frame.height >= 200 {
            fontSize = 270
            style.alignment = .left
        }
        if Bundle.main.preferredLocalizations.first == "hy" {
            fontSize -= 2
        }
        return [NSAttributedString.Key.font: UIFont(name: "\(fontName)", size: CGFloat(fontSize))!,
                NSAttributedString.Key.paragraphStyle:style
        ]
    }()

    @IBInspectable var text: String! {
        didSet {
            setNeedsDisplay()
            UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            text.draw(in: bounds, withAttributes: textAttributes)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let maskLayer = CALayer()
            maskLayer.backgroundColor = UIColor.clear.cgColor
            maskLayer.frame = bounds.offsetBy(dx: bounds.width, dy: 0)
            maskLayer.contents = image?.cgImage
            gradientLayer.mask = maskLayer
            
        }
    }

    override func layoutSubviews() {
        var boundsWidth = UIScreen.main.bounds.width
        
        switch boundsWidth {
        case 320.0:
            boundsWidth += 45
        case 375.0:
            boundsWidth -= 35
        case 390.0:
            boundsWidth -= 60
        case 414.0:
            boundsWidth -= 90
        case 428.0:
            boundsWidth -= 115
        case 476.0:
            boundsWidth -= 140
        default:
            return
        }
        
//        if self.frame.height >= 200 {
//            boundsWidth += 0
//        }
        
        gradientLayer.frame = CGRect (
            x: -boundsWidth,
            y: bounds.origin.y,
            width: 3 * boundsWidth,
            height: bounds.size.height)
    }
    
    lazy var gradientAnimation: CABasicAnimation = {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.75, 1.0, 1.0]
        gradientAnimation.duration = 4.0
        gradientAnimation.autoreverses = true
        gradientAnimation.repeatCount = Float.infinity
        return gradientAnimation
    }()
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        layer.addSublayer(gradientLayer)
        
        gradientLayer.add(gradientAnimation, forKey: nil)
    }
}
