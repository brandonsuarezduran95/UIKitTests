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
            Title.localNotifications,
            Title.searchController,
            Title.asyncNetworkCall,
            Title.uiVisualEffect,
            Title.responderChain
        ]
        
        func getControllerAt(index position: Int) -> UIViewController {
            switch position {
            case 0:     return LocalNotificationsViewController()
            case 1:     return SearchControllerViewController()
            case 2:     return AsyncNetworkCallViewController()
            case 3:     return UIVisualEffectViewController()
            case 4:     return ResponderChainController()
            default:    return UIViewController()
            }
        }
    }
}

// HomeViewController + ViewModel + Constants

extension HomeViewController.ViewModel {
    enum Title {
        static let localNotifications = "Local Notifications"
        static let searchController = "Search Controller"
        static let asyncNetworkCall = "Async Network Call"
        static let uiVisualEffect = "UIVisualEffect"
        static let responderChain = "Responder Chain"
    }
}
