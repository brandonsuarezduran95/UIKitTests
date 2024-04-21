//
//  CacheManager.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/16/24.
//

import UIKit

final class CacheManager {
    
    #warning("Implement safe caching with a fixed max amount of images stored")
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    static let shared = CacheManager()

    private init() { }
    
    func cacheImage(image: UIImage, key: String) {
        let cacheKey = NSString(string: key)
        imageCache.setObject(image, forKey: cacheKey)
    }
    
    func getImageWith(key: String) -> UIImage? {
        let cacheKey = NSString(string: key)
        let image = imageCache.object(forKey: cacheKey)
        
        return image
    }
}
