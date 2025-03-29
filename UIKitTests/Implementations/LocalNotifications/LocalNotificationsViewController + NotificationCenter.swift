//
//  LocalNotificationsViewController + NotificationCenter.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/2/24.
//

import UIKit

extension LocalNotificationsViewController {
    
    func registerToNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveAuthenticationStatus), name: .pushNotificationAuthenticationStatus, object: nil)
    }
    
    @objc func didReceiveAuthenticationStatus(notification: NSNotification) {
        guard let authorizationStatus = notification.object as? UNAuthorizationStatus else { return }
        
        switch authorizationStatus {
        case .notDetermined:
            self.status = "Not Determined"
        case .denied:
            self.status = "Denied"
        case .authorized:
            self.status = "Authorized"
        case .provisional:
            self.status = "Provisional"
        case .ephemeral:
            self.status = "Ephemeral"
        @unknown default:
            self.status = "@unknown"
        }
    }
}
