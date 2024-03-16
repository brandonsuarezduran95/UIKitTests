//
//  ImagePresenterViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/12/24.
//

import UIKit

class ImagePresenterViewController: UIViewController {
    
    let imageView = UIImageView()
    var cache = CacheManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
}

extension ImagePresenterViewController {
    func setupController() {
        view.backgroundColor = .systemGray6
        title = "Image"
        
        view.addSubview(imageView)
        setupImageView()
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            imageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 12),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            imageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -12)
        ])
    }
    
    func configureWith(url: String) {
        
        if let cachedImage = cache.getImageWith(key: url) {
            DispatchQueue.main.async { [unowned self] in
                self.imageView.image = cachedImage
            }
            
        } else {
            guard let url = URL(string: url) else {
                return
            }
            
            Task.detached(priority: .background) {

                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async { [unowned self] in
                        let image = UIImage(data: data)
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}
