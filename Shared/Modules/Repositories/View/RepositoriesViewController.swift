//
//  RepositoriesViewController.swift
//  SwiftRepositories
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import UIKit

final class RepositoriesViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: RepositoriesPresenterProtocol!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyStyle()
        presenter.loadData()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: RepositoryTableViewCell.self)
    }
    
    private func applyStyle() {
        self.title = "Repositories"
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }

}

//MARK: - RepositoriesViewProtocol

extension RepositoriesViewController: RepositoriesViewProtocol {
    
    func updateRepositoriesList() {
        self.tableView.reloadData()
    }
    
    func showProgress() {
        self.showProgressHud()
    }
    
    func hideProgress() {
        self.hideProgressHud()
    }
    
    func showErrorAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - TableView

extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRepositories()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(repository: presenter.repositoryForIndex(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectedRepository(indexPath.row)
    }
    
}
