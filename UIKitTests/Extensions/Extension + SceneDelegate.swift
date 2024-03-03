//
//  Extension + SceneDelegate.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/2/24.
//

import Foundation
import UserNotifications

extension SceneDelegate {
    
    /// Check the LocalNotificationsViewController for its  implementation
    func checkForPushNotificationPermission() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            let status = settings.authorizationStatus
            
            /// Pass data/Objects from NotificationCenter
            /// https://medium.com/@nimjea/notificationcenter-in-swift-104b31f59772
            NotificationCenter.default.post(name: .pushNotificationAuthenticationStatus, object: status)
        }
    }
    
}
