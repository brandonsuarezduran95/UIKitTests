//
//  SheetViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/13/24.
//

import UIKit

// MARK: - Navigation Controller Sheet
class SheetNavigationController: UINavigationController {
    
    // Embedding the SheetViewController so that the title can be shown as part of the navigation controller
    init(message: String, title: String) {
        let rootController = SheetViewController(message: message, mainTitle: title)
        super.init(rootViewController: rootController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Root View Controller
class SheetViewController: UIViewController {
    
    let message: String
    let mainTitle: String
    
    let messageLabel = UILabel()
    
    init(message: String, mainTitle: String) {
        self.message = message
        self.mainTitle = mainTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
}
