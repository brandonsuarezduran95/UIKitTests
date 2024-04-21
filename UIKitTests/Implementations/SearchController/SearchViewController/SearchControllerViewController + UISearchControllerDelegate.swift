//
//  SearchControllerViewController + UISearchControllerDelegate.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/10/24.
//

import UIKit

// A set of delegate methods for search controller objects.
extension SearchControllerViewController: UISearchControllerDelegate {
    
    // These are like the viewController life Cycle, but for the searchController when being presented, dismissed
    
    func didDismissSearchController(_ searchController: UISearchController) {
        print("didDismissSearchController")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        print("didPresentSearchController")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        print("willDismissSearchController")
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        print("willPresentSearchController")
    }
    
    func presentSearchController(_ searchController: UISearchController) {
        print("presentSearchController")
    }
}
