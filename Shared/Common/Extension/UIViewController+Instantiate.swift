//
//  UIViewController+Instantiate.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import UIKit

public enum FlowType {
    case navigation
    case push
    case modal
    case overContent
}

extension UIViewController {
    
    @objc public class func instantiate() -> Self {
        func instantiateFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            let t = T.init(nibName: String(describing: T.self), bundle: Bundle.init(for: T.self))
            t.modalPresentationStyle = .fullScreen
            return t
        }
        
        return instantiateFromNib(self)
    }
    
    public func go(to viewController: UIViewController, flowType: FlowType, animated: Bool =  true) {
        switch flowType {
        case .push:
            self.navigationController?.pushViewController(viewController, animated: animated)
        case .modal:
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: animated, completion: nil)
        case .navigation:
            let navigation = UINavigationController(rootViewController: viewController)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: animated, completion: nil)
        case .overContent:
            viewController.modalPresentationStyle = .overCurrentContext
            self.present(viewController, animated: animated, completion: nil)
        }
    }
    
}

