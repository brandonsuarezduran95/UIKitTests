//
//  SearchControllerViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/2/24.
//

import UIKit
import Combine

class SearchControllerViewController: UIViewController {
    
    let searchController = UISearchController()
    
    let infoLabel = UILabel()
    let table = UITableView(frame: .zero, style: .insetGrouped)
    
    let viewModel = ViewModel()
    var cancellable: Set<AnyCancellable> = []
    
    var dataSource: [PostsModel] = [] {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                table.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        
        viewModel.$dataSource.sink { [unowned self] newData in
            self.dataSource = newData
        }.store(in: &cancellable)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchData()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Search Controller"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
