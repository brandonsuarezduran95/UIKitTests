//
//  TableViewController + UITableViewDelegate.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 1/1/25.
//

import UIKit

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// This will make the row be deselected with an animation
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let controller = StylesTableViewController(style: .insetGrouped)
            navigationController?.pushViewController(controller, animated: true)
        default:
            break
        }
    }
}
