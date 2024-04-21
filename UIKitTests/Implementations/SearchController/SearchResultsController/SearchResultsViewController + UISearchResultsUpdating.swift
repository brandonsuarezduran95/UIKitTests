//
//  SearchResultsViewController + UISearchResultsUpdating.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit

extension SearchResultsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, let resultsController = searchController.searchResultsController as? ResultsViewController {
            viewModel.getUnsplashPhotosBy(search: searchText, page: 1)
            resultsController.searchData = dataSource.results
            
        }
    }
}
