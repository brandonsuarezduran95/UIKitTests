//
//  HomeViewController + ViewModel.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 2/28/24.
//

import UIKit

extension HomeViewController {
    // Decoupling the list of controllers into a viewModel Struct
    struct ViewModel {
        
        let titles: [String] = [
            "Local Notifications",
            "Search Controller"
        ]
        
        func getControllerAt(index position: Int) -> UIViewController {
            switch position {
            case 0:
                return LocalNotificationsViewController()
                
            case 1:
                return SearchControllerViewController()
                
            default:
                return UIViewController()
            }
        }
        
    }
}
