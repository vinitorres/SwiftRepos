//
//  RepositoryDetailsProtocols.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import Foundation
import UIKit

// MARK: - Presenter
protocol RepositoryDetailsPresenterProtocol {
    
    var view: RepositoryDetailsViewProtocol! { get set }
    var router: RepositoryDetailsRouterProtocol! { get set }

    func getRepository() -> Repository
    
}

// MARK: - View
protocol RepositoryDetailsViewProtocol {
    
    var presenter: RepositoryDetailsPresenterProtocol! { get set }
    
}

// MARK: - Router
protocol RepositoryDetailsRouterProtocol {
    
    var viewController: UIViewController! { get set }
        
}
