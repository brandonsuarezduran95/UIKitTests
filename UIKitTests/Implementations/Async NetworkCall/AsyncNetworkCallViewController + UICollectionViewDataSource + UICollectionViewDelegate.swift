//
//  AsyncNetworkCallViewController + UICollectionViewDataSource + UICollectionViewDelegate.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/11/24.
//

import UIKit

extension AsyncNetworkCallViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = dataSource[indexPath.item].urls.regular
        let controller = ImagePresenterViewController()
        controller.configureWith(url: url)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension AsyncNetworkCallViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let url = dataSource[indexPath.item].urls.regular
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell

        Task {
            do {
                let image = try await NetworkManager.shared.downloadImage(from: url)
                
                DispatchQueue.main.async { [unowned self, weak cell] in
                    if let cachedImage = self.cache.getImageWith(key: url) {
                        cell?.imageView.image = cachedImage
                    } else {
                        self.cache.cacheImage(image: image, key: url)
                        cell?.imageView.image = image
                    }
                }
            } catch(let error)  {
                print("Error found while downloading Image: \(error.localizedDescription)")
            }
        }
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.backgroundColor = .systemGray4
        return cell
    }
    
    
}
