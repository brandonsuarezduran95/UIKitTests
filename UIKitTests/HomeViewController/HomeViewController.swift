//
//  ViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 2/28/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }

}

extension HomeViewController {
    
    func setupController() {
        view.backgroundColor = .systemGray6
        title = Constants.controllerTitle
        navigationController?.navigationBar.prefersLargeTitles = true

        addViews()
        setupTableView()
        
    }
    
    func addViews() {
        view.addSubview(tableView)
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -9),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.controllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = viewModel.controllers[indexPath.row].title ?? Constants.noNameTitle
        
        // Cell
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.accessoryType = .disclosureIndicator
        
        // Configuring the cell
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = title
        cell.contentConfiguration = contentConfiguration
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = viewModel.controllers[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
