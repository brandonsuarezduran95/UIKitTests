//
//  TableViewController + UITableViewDataSource.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 1/1/25.
//

import UIKit

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = dataSource[indexPath.row]
        cell.contentConfiguration = configuration
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
