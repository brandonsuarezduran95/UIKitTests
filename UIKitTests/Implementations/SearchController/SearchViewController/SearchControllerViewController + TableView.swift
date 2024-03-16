//
//  SearchControllerViewController + TableView.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit

extension SearchControllerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataSource[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.selectionStyle = .none
        
        var content = cell.defaultContentConfiguration()
        content.text = data.title
        content.secondaryText = String(data.id)
        
        cell.contentConfiguration = content
        return cell
    }
}
