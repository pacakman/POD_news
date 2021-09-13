//
//  ExtensionView.swift
//  POD_news
//
//  Created by Idris on 13/09/21.
//

import UIKit
extension UIView {
    static func NIB<T>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: self, options: nil)?.first as! T
    }
}
