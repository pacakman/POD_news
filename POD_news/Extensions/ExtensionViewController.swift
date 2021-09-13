//
//  ExtensionViewController.swift
//  POD_news
//
//  Created by Idris on 13/09/21.
//

import UIKit
private var loadingKey: UInt8 = 0
extension UIViewController {
    var loadingView: UIView? {
        get {
            return associatedObject(base: self, key: &loadingKey)
        }
        set {
            associateObject(base: self, key: &loadingKey, value: newValue)
        }
    }
    func setIsLoadingWithAlpha(_ isLoading: Bool, _ alpha: Float = 1) {
        if isLoading {
            view.isUserInteractionEnabled = false
            guard let loadingView = loadingView else { return }
            view.addSubview(loadingView)
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            let left = loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            let top = loadingView.topAnchor.constraint(equalTo: view.topAnchor)
            let right = loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            let bottom = loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            NSLayoutConstraint.activate([
                left, top, right, bottom
            ])
            loadingView.alpha = CGFloat(alpha)
        } else {
            view.isUserInteractionEnabled = true
            loadingView?.removeFromSuperview()
        }
    }
}

func associatedObject<ValueType: AnyObject>(base: AnyObject, key: UnsafePointer<UInt8>) -> ValueType? {
    return objc_getAssociatedObject(base, key) as? ValueType
}
func associateObject<ValueType: AnyObject>(base: AnyObject,
                                           key: UnsafePointer<UInt8>,
                                           value: ValueType?) {
    objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN)
}
