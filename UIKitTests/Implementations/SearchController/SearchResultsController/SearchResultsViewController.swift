//
//  SearchResultsViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit
import Combine

class SearchResultsViewController: UIViewController {
    
    let infoLabel = UILabel()
    let searchController = UISearchController(searchResultsController: ResultsViewController())
    let viewModel = ViewModel()
    var dataSource: UnSplashSearchModel = UnSplashSearchModel(results: [])
    var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        viewModel.$dataSource.sink { [unowned self] newValue in
            self.dataSource = newValue
        }.store(in: &cancellables)
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Search Results Controller"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
