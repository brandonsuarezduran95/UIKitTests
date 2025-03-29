//
//  StylesTableViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 1/2/25.
//

import UIKit

class StylesTableViewController: UITableViewController {
    let dataSource = ["Default Style", "Subtitle Style", "Value1 Style", "Value2 Style"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cell Styles"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titleForCell = self.dataSource[indexPath.row]
        let cellA = UITableViewCell(style: .default, reuseIdentifier: nil)
        let cellB = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let cellC = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let cellD = UITableViewCell(style: .value2, reuseIdentifier: nil)
        // Configure the cell...
        cellA.selectionStyle = .none
        cellB.selectionStyle = .none
        cellC.selectionStyle = .none
        cellD.selectionStyle = .none
        
        cellA.contentConfiguration = setConfigurationFor(cellA, title: titleForCell)
        cellB.contentConfiguration = setConfigurationFor(cellB, title: titleForCell)
        cellC.contentConfiguration = setConfigurationFor(cellC, title: titleForCell)
        cellD.contentConfiguration = setConfigurationFor(cellD, title: titleForCell)
        
        // Returning the cell...
        switch indexPath.row {
        case 0:
            return cellA
        case 1:
            return cellB
        case 2:
            return cellC
        case 3:
            return cellD
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func setConfigurationFor(_ cell: UITableViewCell, title: String) -> UIListContentConfiguration {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = title
        configuration.secondaryText = "Some Secondary Text Here"
        configuration.image = .init(systemName: "star.fill")
        
        return configuration
    }
}
