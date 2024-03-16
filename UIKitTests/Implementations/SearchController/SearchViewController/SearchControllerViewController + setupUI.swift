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
        // Assign the searchController to the navigation's bar navigationItem's searchController property
        navigationItem.searchController = searchController
        
        // assign the searchController's searchResultsUpdater property to self to have access to the delegate's methods
        searchController.searchResultsUpdater = self
        
        // Use the delegate object to receive notifications when the search results controller is presented and dismissed.
        searchController.delegate = self
        
        // Set up the searchController's properties
        searchController.searchBar.placeholder = "Enter  a search"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.automaticallyShowsCancelButton = true
        
        let suggestions = createSearchSuggestions()
        
        // The suggestions will appear as the user taps on the search bar
        searchController.searchSuggestions = suggestions
    }
    
    func createSearchSuggestions() -> [UISearchSuggestionItem] {
        
        /// All these are variations of the UISearchSuggestionItem initializer
        
        // -> This would be the second use case
        let searchSuggestionA: UISearchSuggestionItem = .init(localizedSuggestion: "Suggestion A", localizedDescription: "Localized Description A", iconImage: .init(systemName: "a.circle.fill"))
        
        let attributesB: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .body),
            .foregroundColor: UIColor.systemBlue,
            .textEffect:  NSAttributedString.TextEffectStyle.letterpressStyle as NSString
        ]
        
        let attributedStringB = NSAttributedString(string: "Suggestion B",attributes: attributesB)
        
        let searchSuggestionB: UISearchSuggestionItem = .init(localizedAttributedSuggestion: attributedStringB, localizedDescription: "Localized Description B", iconImage: .init(systemName: "b.circle.fill"))

        let searchSuggestionC: UISearchSuggestionItem = .init(localizedSuggestion: "Suggestion C", localizedDescription: "Localized Description C")
        
        let attributesD: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .body),
            .foregroundColor: UIColor.systemOrange,
            .textEffect:  NSAttributedString.TextEffectStyle.letterpressStyle as NSString
        ]
        let attributeD = NSAttributedString(string: "Suggestion D", attributes: attributesD)
        let searchSuggestionD: UISearchSuggestionItem = .init(localizedAttributedSuggestion: attributeD, localizedDescription: "Localized Description D")
        
        // -> This would be the first use case most of the time
        let searchSuggestionE: UISearchSuggestionItem = .init(localizedSuggestion: "Suggestion E")
        
        let attributesF: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .body),
            .foregroundColor: UIColor.systemGreen,
            .textEffect:  NSAttributedString.TextEffectStyle.letterpressStyle as NSString
        ]
        let attributeF = NSAttributedString(string: "Suggestion F", attributes: attributesF)
        let searchSuggestionF: UISearchSuggestionItem = .init(localizedAttributedSuggestion: attributeF)
        
        let suggestions: [UISearchSuggestionItem] = [
            searchSuggestionA,
            searchSuggestionB,
            searchSuggestionC,
            searchSuggestionD,
            searchSuggestionE,
            searchSuggestionF
        ]
        
        return suggestions
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
