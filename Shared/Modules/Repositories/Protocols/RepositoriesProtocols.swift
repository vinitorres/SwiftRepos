//
//  RepositoriesProtocols.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import Foundation
import UIKit

// MARK: - Interactor
protocol RepositoriesInteractorProtocol {
    
    var presenter: RepositoriesPresenterProtocol! { get set }

    func fetchRepositories()
    
}

// MARK: - Presenter
protocol RepositoriesPresenterProtocol {
    
    var view: RepositoriesViewProtocol! { get set }
    var router: RepositoriesRouterProtocol! { get set }
    var interactor: RepositoriesInteractorProtocol! { get set }

    func loadData()
    func receveidError(error: String) 
    func didSelectedRepository(_ index: Int)
    func setRepositories(repositories: [Repository])
    func numberOfRepositories() -> Int
    func repositoryForIndex(_ index: Int) -> Repository
    
}

// MARK: - View
protocol RepositoriesViewProtocol {
    
    var presenter: RepositoriesPresenterProtocol! { get set }

    func updateRepositoriesList()
    func showProgress()
    func hideProgress()
    func showErrorAlert(errorMessage: String)
    
}

// MARK: - Router
protocol RepositoriesRouterProtocol {
    
    var viewController: UIViewController! { get set }
    
    func goToDetails(repository: Repository)
    
}
