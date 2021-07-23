//
//  RepositoriesPresenter.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import Foundation

final class RepositoriesPresenter: RepositoriesPresenterProtocol {
    
    var view: RepositoriesViewProtocol!
    var router: RepositoriesRouterProtocol!
    var interactor: RepositoriesInteractorProtocol!
    
    private var repositories: [Repository] = []
    
    func loadData() {
        view.showProgress()
        interactor.fetchRepositories()
    }
    
    func didSelectedRepository(_ index: Int){
        router.goToDetails(repository: self.repositories[index])
    }
    
    func receveidError(error: String) {
        view.hideProgress()
        view.showErrorAlert(errorMessage: error)
    }
    
    func setRepositories(repositories: [Repository]) {
        view.hideProgress()
        self.repositories = repositories
        view.updateRepositoriesList()
    }
    
    func numberOfRepositories() -> Int {
        self.repositories.count
    }
    
    func repositoryForIndex(_ index: Int) -> Repository {
        self.repositories[index]
    }
    
    func didSelectedRepository(repository: Repository) {
        router.goToDetails(repository: repository)
    }
    
}
