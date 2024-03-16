//
//  AsyncNetworkCallViewController + setUpUI.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/11/24.
//

import UIKit

extension AsyncNetworkCallViewController {
    func setupController() {
        view.backgroundColor = .systemGray6
        title = "Async N.W. Call"
        
        view.addSubview(collectionView)
        setupCollectionView()
        setUpPlusButton()
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .systemGray6
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 9),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 9),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -9),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -9)
        ])
    }
    
    func setUpPlusButton() {
        let action = UIAction { [unowned self] _ in
            let controller = StatusController()
            
            if let sheet = controller.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
            }
            
            self.present(controller, animated: true)
        }
        
        let button = UIBarButtonItem(systemItem: .add, primaryAction: action)
        navigationItem.rightBarButtonItem = button
    }
}
