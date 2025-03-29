//
//  TableViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 1/1/25.
//

import UIKit

class TableViewController: UIViewController {
    
    let dataSource: [String] = [
        "Cell Styles",
        "Cell Sections"
    ]
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
}
