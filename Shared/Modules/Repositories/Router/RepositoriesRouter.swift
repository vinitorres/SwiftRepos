//
//  RepositoriesRouter.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import Foundation
import UIKit

final class RepositoriesRouter: RepositoriesRouterProtocol, Storyboarded {
    
    static let storyboardName = "RepositoriesViewController"
    
    weak var viewController: UIViewController!
    
    static func assembleModule() -> RepositoriesViewController {
        
        let view: RepositoriesViewController = storyboard.instantiateViewController()
        let presenter = RepositoriesPresenter()
        let router = RepositoriesRouter()
        let interactor = RepositoriesInteractor()
        
        view.presenter = presenter
        
        router.viewController = view
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter

        return view
    }
    
    func goToDetails(repository: Repository) {
        let detailsViewController = RepositoryDetailsRouter.assembleModule(repository: repository)
        viewController.show(detailsViewController, sender: nil)// (detailsViewController, animated: true, completion: nil)
    }
    
}
