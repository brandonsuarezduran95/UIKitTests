//
//  ResultsViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/3/24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    #warning("Implement the ResultsViewController to display data when the search bar is typed")
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    let cache = CacheManager.shared
    
    var searchData: [UnSplashModel] = [] {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }

}
