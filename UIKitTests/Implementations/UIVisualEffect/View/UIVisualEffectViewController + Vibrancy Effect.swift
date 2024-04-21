//
//  UIVisualEffectViewController + Vibrancy Effect.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/19/24.
//

import UIKit

extension UIVisualEffectViewController {
    func setupVibrancyEffectView(blur: UIBlurEffect.Style, style: UIVibrancyEffectStyle) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect, style: .fill)
        let visualEffectView = UIVisualEffectView(effect: vibrancyEffect)
        
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .black
        squareView.layer.cornerRadius = 10
        visualEffectView.contentView.addSubview(squareView)
        
        NSLayoutConstraint.activate([
            squareView.centerXAnchor.constraint(equalTo: visualEffectView.contentView.centerXAnchor),
            squareView.centerYAnchor.constraint(equalTo: visualEffectView.contentView.centerYAnchor),
            squareView.widthAnchor.constraint(equalToConstant: 100),
            squareView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        return visualEffectView
    }
}
