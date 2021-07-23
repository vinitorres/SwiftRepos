//
//  RepositoryDetailsPresenter.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 23/07/21.
//

import Foundation

final class RepositoryDetailsPresenter: RepositoryDetailsPresenterProtocol {
        
    var view: RepositoryDetailsViewProtocol!
    var router: RepositoryDetailsRouterProtocol!
    
    private var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func getRepository() -> Repository {
        return self.repository
    }
    
}
