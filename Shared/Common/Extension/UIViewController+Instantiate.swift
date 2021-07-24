//
//  UIViewController+Instantiate.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 24/07/21.
//

import UIKit

extension UIViewController {
    
    @objc public class func instantiate() -> Self {
        func instantiateFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            let t = T.init(nibName: String(describing: T.self), bundle: Bundle.init(for: T.self))
            t.modalPresentationStyle = .fullScreen
            return t
        }
        
        return instantiateFromNib(self)
    }
    
}
