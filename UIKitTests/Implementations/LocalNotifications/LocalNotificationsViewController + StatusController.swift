//
//  LocalNotificationsViewController + StatusController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 2/29/24.
//

import UIKit

extension LocalNotificationsViewController {
    
    class StatusController: UIViewController {
        
        let titleLabel = UILabel()
        let statusLabel = UILabel()
        let statusText: String
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupController()
        }
        
        init(statusText: String) {
            self.statusText = statusText
            super.init(nibName: nil, bundle: nil)

        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}

extension LocalNotificationsViewController.StatusController {
    func setupController() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(statusLabel)
        setupTitleLabel()
        setupLabel()
    }
    
    func setupTitleLabel() {
        titleLabel.font = .preferredFont(forTextStyle: .title3)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = "Authorization Info"
        titleLabel.textColor = .black
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    func setupLabel() {
        statusLabel.font = .preferredFont(forTextStyle: .body)
        statusLabel.textAlignment = .left
        statusLabel.numberOfLines = 0
        statusLabel.text = statusText
        statusLabel.textColor = .black
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            statusLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
}
