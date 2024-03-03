//
//  SearchControllerViewController + setupUI.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit

extension SearchControllerViewController {
    
    func setupController() {
        view.backgroundColor = .systemGray6
        setupSearchController()
        
        view.addSubview(infoLabel)
        view.addSubview(table)
        
        setupInfoLabel()
        setupTableView()
        addBarButton()
    }
    
    func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    func setupInfoLabel() {
        
        infoLabel.font = UIFont.preferredFont(forTextStyle: .body)
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .left
        infoLabel.text = "This Search Controller updates the result of the search on its view.\nType on the search bar to filter the data, the search is filtered through the cell's subtitle Number."
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            infoLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            infoLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    func addBarButton() {
        let action = UIAction { [unowned self] _ in
            let controller = SearchResultsViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        let barButton = UIBarButtonItem(systemItem: .add, primaryAction: action)
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    func setupTableView() {
        table.delegate = self
        table.dataSource = self
        
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 12),
            table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
}
