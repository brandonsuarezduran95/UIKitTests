//
//  AsyncNetworkCallViewController + StatusController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/16/24.
//

import UIKit

extension AsyncNetworkCallViewController {
    
    class StatusController: UIViewController {
        
        let titleLabel = UILabel()
        let descriptionLabel = UILabel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupController()
        }
    }
}

extension AsyncNetworkCallViewController.StatusController {
    func setupController() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        setupTitleLabel()
        setupLabel()
    }
    
    func setupTitleLabel() {
        titleLabel.font = .preferredFont(forTextStyle: .title3)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = "Info"
        titleLabel.textColor = .black
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    func setupLabel() {
        let infoText: String = "You call async functions inside a Task, make sure to use the await keyword before calling the function, the Task will wait for the async function finishes its execution before continuing with the next line of code, that is why they are called inside a Task. \n\nThe NSCache class accepts two type parameters to initialize, i.e NSCache<Key, Object>(), the Key usually is of type NSString, the Object type is the type that you want to store."
        
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = infoText
        descriptionLabel.textColor = .black
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
}
