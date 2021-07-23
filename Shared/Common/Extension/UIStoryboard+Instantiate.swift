//
//  UIStoryboard+Instantiate.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import Foundation
import UIKit

extension UIStoryboard {

    func instantiateViewController<T: UIViewController>() -> T {
        let identifier = String(describing: T.self)
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Failed to instantiate ViewController with identifier \(identifier)")
        }
        return viewController
    }

}
