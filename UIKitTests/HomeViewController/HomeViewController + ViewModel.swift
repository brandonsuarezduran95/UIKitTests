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
        let controllers: [UIViewController] = [
            LocalNotificationsViewController(),
            SearchControllerViewController()
        ]
    }
}
