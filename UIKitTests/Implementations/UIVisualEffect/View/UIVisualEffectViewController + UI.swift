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
    
    func setupImageView() {
        let image = UIDevice.current.orientation.isPortrait ? UIImage(named: "portraitLightBulb") : UIImage(named: "landscapeLightBulb")
        
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
        stackView.removeArrangedSubview(visualEffectViewA)
        stackView.removeArrangedSubview(visualEffectViewB)
        stackView.removeArrangedSubview(visualEffectViewC)
    }
    
    // MARK: -  Blur Effect
    
    func setupBlurEffectView(style: UIBlurEffect.Style) -> UIVisualEffectView {
        let visualEffectView = createBlurViewWith(style: style)
        embedLabelIn(view: visualEffectView, forText: "\(style)")
        return visualEffectView
    }
    
    private func createBlurViewWith(style: UIBlurEffect.Style) -> UIVisualEffectView{
        let visualEffectView = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: style)
        visualEffectView.effect = blurEffect
        
        view.addSubview(visualEffectView)
        
        return visualEffectView
    }
    
    private func embedLabelIn(view: UIView, forText text: String) {
        
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .body)
        
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 5
        
        guard let visualEffectView = view as? UIVisualEffectView else { return }
        
        visualEffectView.contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            containerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 6)
        ])
        
        containerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 6),
            label.leftAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leftAnchor, constant: 6),
            label.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            label.rightAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.rightAnchor, constant: -6)
        ])
    }
    
    // MARK: - Navigation Item
    
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
        let button = UIBarButtonItem(title: nil, image: UIImage(systemName: "eraser.line.dashed.fill"), target: self, action: #selector(presentEffectView))
        navigationItem.rightBarButtonItems?.append(button)
    }
    
    // MARK: - Vibrancy Effect
    private func createVibrancyEffect(blurEffect: UIBlurEffect.Style, style: UIVibrancyEffectStyle) -> UIVisualEffectView {
        let visualEffectView = UIVisualEffectView()
        let vibrancyEffect = UIVibrancyEffect(blurEffect: .init(style: blurEffect), style: style)
        
        visualEffectView.effect = vibrancyEffect
        return visualEffectView
    }
    
    func setupVibrancyEffectView(blurEffect: UIBlurEffect.Style, style: UIVibrancyEffectStyle) -> UIVisualEffectView {
        let visualEffectView = createVibrancyEffect(blurEffect: blurEffect, style: style)
        embedLabelIn(view: visualEffectView, forText: "\(style)")
        return visualEffectView
    }
    
}
