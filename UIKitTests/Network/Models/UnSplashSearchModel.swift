//
//  UnSplashSearchModel.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/17/24.
//

import Foundation

/// https://api.unsplash.com/search/photos?page=1&query=office&client_id=HUr7CAIeshOOQ6q0r-XURcy18uTnk8xcG9s0CwDVc5Q

struct UnSplashSearchModel: Codable {
    let results: [UnSplashModel]
}
