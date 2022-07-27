//
//  Date Formatter Extension.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 05.06.22.
//

import UIKit

extension Int {
    func formatWithZeros() -> String {
        if 0..<10 ~= self {
            return "0" + String(self)
        } else if self >= 10 {
            return String(self)
        }
        return ""
    }
}



extension String {
    func localizeString(string: String) -> String {
        let path = Bundle.main.path(forResource: "hy", ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: string, comment: "")
    }
}
var bundleKey: UInt8 = 0

class AnyLanguageBundle: Bundle {

override func localizedString(forKey key: String,
                              value: String?,
                              table tableName: String?) -> String {

    guard let path = objc_getAssociatedObject(self, &bundleKey) as? String,
        let bundle = Bundle(path: path) else {

            return super.localizedString(forKey: key, value: value, table: tableName)
    }

    return bundle.localizedString(forKey: key, value: value, table: tableName)
  }
}

extension Bundle {

class func setLanguage(_ language: String) {

    defer {

        object_setClass(Bundle.main, AnyLanguageBundle.self)
    }

    objc_setAssociatedObject(Bundle.main, &bundleKey,    Bundle.main.path(forResource: language, ofType: "lproj"), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
}

