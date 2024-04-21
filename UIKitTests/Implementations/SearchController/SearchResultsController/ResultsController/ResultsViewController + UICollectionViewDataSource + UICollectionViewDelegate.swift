//
//  ResultsViewController + UICollectionViewDataSource + UICollectionViewDelegate.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/20/24.
//

import UIKit

extension ResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let url = searchData[indexPath.item].urls.small
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        Task {
            do {
                let image = try await NetworkManager.shared.downloadImage(from: url)
                DispatchQueue.main.async { [unowned self, weak cell] in
                    if let cachedImage = cache.getImageWith(key: url) {
                        cell?.imageView.image = cachedImage
                    } else {
                        cache.cacheImage(image: image, key: url)
                        cell?.imageView.image = image
                    }
                }
                
            } catch(let error) {
                print("Error found while downloading Image: \(error.localizedDescription)")
            }
        }
        
        return cell
    }
    
    
}
