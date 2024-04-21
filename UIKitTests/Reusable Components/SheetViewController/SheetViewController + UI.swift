//
//  SheetViewController + UI.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/13/24.
//

import UIKit

extension SheetViewController {
    func setupController() {
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = true
        title = mainTitle
        
        view.addSubview(messageLabel)
        
        setupCloseButton()
        setupMessageLabel()
    }
    
    func setupCloseButton() {
        let action = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }
        
        let button = UIBarButtonItem(systemItem: .close, primaryAction: action)
        navigationItem.rightBarButtonItem = button
    }
    
    func setupMessageLabel() {
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.textAlignment = .left
        messageLabel.font = .preferredFont(forTextStyle: .body)
        messageLabel.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messageLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            messageLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
}
