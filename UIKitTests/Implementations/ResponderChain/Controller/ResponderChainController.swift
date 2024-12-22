//
//  ResponderChainController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 10/6/24.
//

import UIKit

class ResponderChainController: UIViewController {
    
    let button = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Responder Chain"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ResponderChainController {
    
    @objc func didTapButton() {
        print("Sent Message")
        print("Responder Chain description:", self.responderChain())
    }
}

// MARK: - Responder Chain Description Extension
extension UIResponder {
    func responderChain() -> String {
        guard let next = next else {
            return String(describing: self)
        }
        return String(describing: self) + " -> " + next.responderChain()
    }
}
