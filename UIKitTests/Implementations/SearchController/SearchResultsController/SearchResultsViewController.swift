//
//  SearchResultsViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    let infoLabel = UILabel()
    let searchController = UISearchController(searchResultsController: ResultsViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Search Results Controller"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
