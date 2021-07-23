//
//  Storyboarded.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//


import Foundation
import UIKit

protocol Storyboarded {

    static var storyboardName: String { get }
    static var storyboard: UIStoryboard { get }

}

extension Storyboarded {

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }

}
