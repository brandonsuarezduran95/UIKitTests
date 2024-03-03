//
//  SearchResultsViewController + setupUI.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit

extension SearchResultsViewController {
    func setupController() {
        view.backgroundColor = .systemGray6
        setupSearchController()
        
        view.addSubview(infoLabel)

        setupInfoLabel()
    }
    
    func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    func setupInfoLabel() {
        
        infoLabel.font = UIFont.preferredFont(forTextStyle: .body)
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .left
        infoLabel.text = "This Search Controller updates the results on the ResultsSearchController.\nType on the search bar to filter the data, the search is filtered through the cell's subtitle Number."
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            infoLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            infoLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
}
