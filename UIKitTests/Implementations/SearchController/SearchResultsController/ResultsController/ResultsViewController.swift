//
//  ResultsViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    #warning("Implement the ResultsViewController to display data when the search bar is typed")
    
    let table = UITableView(frame: .zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }

}
