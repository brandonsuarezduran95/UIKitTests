//
//  AsyncNetworkCallViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/11/24.
//

import UIKit
import Combine

class AsyncNetworkCallViewController: UIViewController {
    
    let viewModel = ViewModel()
    var dataSource: [UnSplashModel] = [] {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.collectionView.reloadData()
            }
        }
    }
    var cancellables: Set<AnyCancellable> = []
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    let cache = CacheManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        
        viewModel.$dataSource.receive(on: DispatchQueue.main).sink { [unowned self] newData in
            self.dataSource = newData
        }.store(in: &cancellables)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchPhotosData()
    }
    
}
