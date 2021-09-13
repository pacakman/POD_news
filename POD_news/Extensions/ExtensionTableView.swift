//
//  ExtensionTableView.swift
//  POD_news
//
//  Created by Idris on 10/09/21.
//

import UIKit

extension UITableView {
    
    // register nib
    func registerNIB(with cellClass: AnyClass) {
       let className = String(describing: cellClass)
       register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }

    // dequeue cell
    func dequeueCell<T>(with cellClass: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: cellClass)) as! T
    }
}
