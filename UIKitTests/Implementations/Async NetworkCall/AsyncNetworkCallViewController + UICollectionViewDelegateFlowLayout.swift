//
//  AsyncNetworkCallViewController + UICollectionViewDelegateFlowLayout.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/11/24.
//

import UIKit

extension AsyncNetworkCallViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100.0, height: 100.0)
    }
}
