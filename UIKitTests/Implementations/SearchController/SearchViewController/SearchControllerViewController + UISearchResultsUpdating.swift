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
    
    /// Asks the object to update the search results for a specified controller after the user selects a search suggestion.
    func updateSearchResults(for searchController: UISearchController, selecting searchSuggestion: any UISearchSuggestion) {
        
        if searchSuggestion.localizedSuggestion == "Suggestion A" {
            dataSource = viewModel.dataSource.filter({ item in
                return item.id == 29
            })
        } else if searchSuggestion.localizedSuggestion == "Suggestion B" {
            dataSource = viewModel.dataSource.filter({ item in
                return item.id == 12
            })
        } else if searchSuggestion.localizedSuggestion == "Suggestion C" {
            dataSource = viewModel.dataSource.filter({ item in
                return item.id == 23
            })
        } else if searchSuggestion.localizedSuggestion == "Suggestion D" {
            dataSource = viewModel.dataSource.filter({ item in
                return item.id == 34
            })
        } else if searchSuggestion.localizedSuggestion == "Suggestion E" {
            dataSource = viewModel.dataSource.filter({ item in
                return item.id == 45
            })
        } else if searchSuggestion.localizedSuggestion == "Suggestion F" {
            dataSource = viewModel.dataSource.filter({ item in
                return item.id == 56
            })
        }
    }
}
