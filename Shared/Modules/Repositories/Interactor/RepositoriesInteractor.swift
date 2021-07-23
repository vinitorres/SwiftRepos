//
//  RepositoriesInteractor.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import Foundation

final class RepositoriesInteractor: RepositoriesInteractorProtocol {
    
    var presenter: RepositoriesPresenterProtocol!
    
    private var repositoriesService: RepositoriesServiceProtocol
    
    init(repositoriesService: RepositoriesServiceProtocol = RepositoriesService()) {
        self.repositoriesService = repositoriesService
    }

    func fetchRepositories() {
        repositoriesService.getSwiftRepositories { [weak self] result in
            guard let weakSelf = self else { return }
            do {
                guard let result = try result() else { return }
                weakSelf.presenter.setRepositories(repositories: result)
            } catch (let error) {
                weakSelf.presenter.receveidError(error: error.localizedDescription)
            }
        }
    }
    
}
