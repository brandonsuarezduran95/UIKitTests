//
//  AsyncNetworkCallViewController + ViewModel.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/11/24.
//

import Foundation
import Combine

extension AsyncNetworkCallViewController {
    class ViewModel: ObservableObject {
        let manager = NetworkManager.shared
        @Published var dataSource: [UnSplashModel] = []
        
        func fetchPhotosData() {
            Task {
                do {
                    dataSource = try await manager.getUnsplashData()
                } catch {
                    print("The error is: ",(error as! NetworkError).rawValue)
                }
            }
        }
    }
}
