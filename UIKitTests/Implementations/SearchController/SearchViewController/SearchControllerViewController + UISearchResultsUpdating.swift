//
//  SearchControllerViewController + UISearchResultsUpdating.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/2/24.
//

import UIKit

extension SearchControllerViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            dataSource = viewModel.dataSource.filter({ item in
                return String(item.id).contains(searchText)
            })
        } else {
            dataSource = viewModel.dataSource
        }
    }
    
}
