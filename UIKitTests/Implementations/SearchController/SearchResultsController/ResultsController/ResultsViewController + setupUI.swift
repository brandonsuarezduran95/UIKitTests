//
//  ResultsViewController + setupUI.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit

extension ResultsViewController {
    
    func setupController() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(collectionView)
        setupTableView()
    }
    
    func setupTableView() {
        collectionView.backgroundColor = .systemGray6
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
}
