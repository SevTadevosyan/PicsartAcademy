//
//  ConfigurationFunctions.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 15.06.22.
//

import Foundation
import UIKit

class ConfigurationFunctions {
    static let shared = ConfigurationFunctions()
    init() {}
    
}

@IBDesignable public class RoundedImageView: UIView {

    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = 0.5 * bounds.size.width
    }
}
