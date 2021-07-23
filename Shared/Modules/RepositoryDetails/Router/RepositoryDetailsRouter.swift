//
//  RepositoryDetailsRouter.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import Foundation
import UIKit

final class RepositoryDetailsRouter: RepositoryDetailsRouterProtocol {
        
    weak var viewController: UIViewController!
    
    static func assembleModule(repository: Repository) -> RepositoryDetailsViewController {
        
        let view: RepositoryDetailsViewController = RepositoryDetailsViewController.instantiate()
        let presenter = RepositoryDetailsPresenter(repository: repository)
        let router = RepositoryDetailsRouter()
        
        view.presenter = presenter
        
        router.viewController = view
        
        presenter.view = view
        presenter.router = router
        
        return view
    }
    
}
