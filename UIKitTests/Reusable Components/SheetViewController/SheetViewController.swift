//
//  SheetViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/13/24.
//

import UIKit

class SheetViewController: UIViewController {
    
    let message: String
    let mainTitle: String
    
    init(message: String, mainTitle: String) {
        self.message = message
        self.title = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
