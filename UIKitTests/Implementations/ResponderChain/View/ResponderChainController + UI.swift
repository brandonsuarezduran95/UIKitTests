//
//  ResponderChainController + UI.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 10/6/24.
//

import UIKit


extension ResponderChainController {
    
    func setupController() {
        view.backgroundColor = .systemGray6
        view.addSubview(button)
        
        setupButton()
    }
    
    func setupButton() {
        button.setTitle("Trigger Responder Chain", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 250),
            button.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
}
