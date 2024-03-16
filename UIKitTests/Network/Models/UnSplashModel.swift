//
//  UnSplashModel.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/11/24.
//

import Foundation

/// go to:
/// https://unsplash.com/developers
/// For more information

struct UnSplashModel: Codable {
    let id: String
    let slug: String
    let urls: Urls    
}

struct Urls: Codable {
    let regular: String
    let small: String
    let thumb: String
}

