//
//  UIVisualEffectViewController + UI.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/12/24.
//

import UIKit

extension UIVisualEffectViewController {
    
    func setupController() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(imageView)
        view.addSubview(segmentedControl)
        view.addSubview(stackView)
        
        setupSegmentedControl()
        setupImageView()
        setupStackView()
        setupNavigationItem()
    }
    
    // Segmented Control
    func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(handleValueChangeInControlSelection), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.leftAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            segmentedControl.rightAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // Image View
    func setupImageView() {
        let portraitLightBulb = UIImage(named: "portraitLightBulb")
        let landscapeLightBulb = UIImage(named: "landscapeLightBulb")
        
        let image = UIDevice.current.orientation.isPortrait ? portraitLightBulb : landscapeLightBulb

        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: segmentedControl.safeAreaLayoutGuide.bottomAnchor, constant: 6),
            imageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    // Stack View
    func setupStackView() {
        stackView.axis = .vertical
        
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: segmentedControl.safeAreaLayoutGuide.bottomAnchor, constant: 6),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    func addArrangeSubviews() {
        stackView.addArrangedSubview(visualEffectViewA)
        stackView.addArrangedSubview(visualEffectViewB)
        stackView.addArrangedSubview(visualEffectViewC)
    }
    
    func removeArrangeSubViews() {
        /// In order to remove arrange Subviews on the stack, call the removeArrangedSubview, follow by the .removeFromSuperview
        /// else the view will still show on the stack view, but it will appear as though broken
        stackView.removeArrangedSubview(visualEffectViewA)
        stackView.removeArrangedSubview(visualEffectViewB)
        stackView.removeArrangedSubview(visualEffectViewC)
        visualEffectViewA.removeFromSuperview()
        visualEffectViewB.removeFromSuperview()
        visualEffectViewC.removeFromSuperview()
    }
    
    // Navigation Item
    func setupNavigationItem() {
        navigationItem.rightBarButtonItems = []
        setupInfoNavigationButton()
        setupRemoveEffectNavigationButton()
    }
    
    func setupInfoNavigationButton() {
        let button = UIBarButtonItem(title: nil, image: UIImage(systemName: "info.circle"), target: self, action: #selector(showInformationSheet))
        navigationItem.rightBarButtonItems?.append(button)
    }
    
    func setupRemoveEffectNavigationButton() {
        let button = UIBarButtonItem(title: nil, image: UIImage(systemName: "eraser.line.dashed.fill"), target: self, action: #selector(toggleEffectView))
        navigationItem.rightBarButtonItems?.append(button)
    }
}
