//
//  NetworkError.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/2/24.
//

import Foundation

enum NetworkError: String, Error {
    case badURL
    case badServerResponse
    case badParsing
}
