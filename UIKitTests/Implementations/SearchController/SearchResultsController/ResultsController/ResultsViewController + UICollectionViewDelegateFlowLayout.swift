//
//  ResultsViewController + UICollectionViewDelegateFlowLayout.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/20/24.
//

import UIKit

extension ResultsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100.0, height: 100.0)
    }
}
