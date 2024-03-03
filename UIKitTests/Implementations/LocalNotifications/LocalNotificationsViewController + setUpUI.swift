//
//  LocalNotificationsViewController + setUpUI.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/1/24.
//

import UIKit

extension LocalNotificationsViewController {
    
    func setupController() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(infoLabel)
        view.addSubview(button)
        view.addSubview(provisionalNotificationButton)
        
        setupAlertController()
        
        setupInfoLabel()
        setupButton()
        setupProvisionalNotificationButton()
        setupInfoBarButton()
    }
    
    func setupInfoLabel() {
        
        infoLabel.font = UIFont.preferredFont(forTextStyle: .body)
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .left
        infoLabel.text = "Permission is asked once, the app remembers the user's selection.\nTo reset it, delete the app and reinstall."
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            infoLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            infoLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    // MARK: - Main Buttons
    func setupButton() {
        
        button.setTitle("Request", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        
        let action = UIAction { [unowned self] _ in
            self.checkForPermission(dispatchActions: true)
        }
        button.addAction(action, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupProvisionalNotificationButton() {
        provisionalNotificationButton.setTitle("Provisional", for: .normal)
        provisionalNotificationButton.layer.cornerRadius = 10
        provisionalNotificationButton.backgroundColor = .white
        
        let action = UIAction { [unowned self] _ in
            self.dispatchProvisionalNotification()
        }
        provisionalNotificationButton.addAction(action, for: .touchUpInside)
        
        provisionalNotificationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            provisionalNotificationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            provisionalNotificationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            provisionalNotificationButton.widthAnchor.constraint(equalToConstant: 100),
            provisionalNotificationButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // MARK: - Bar Button
    func setupInfoBarButton() {
        let action = UIAction { [unowned self] _ in
                
            let controller = StatusController(statusText: status)
            
            if let sheet = controller.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
            }
            self.present(controller, animated: true)
        }
        
        let infoButton = UIBarButtonItem(image: .init(systemName: "info.circle"),primaryAction: action)
        navigationItem.rightBarButtonItem = infoButton
    }
    
    // MARK: - Alert Controller
    
    func setupAlertController() {
        alertController.title = "Permission Required"
        alertController.message = "Enable Allow Notifications to receive notifications"
        
        let continueAction = UIAlertAction(title: "Continue", style: .default) { [unowned self] _ in
            self.openAppSettings()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(continueAction)
        alertController.addAction(cancelAction)
    }
}
