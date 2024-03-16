//
//  LocalNotificationsViewController + LocalNotification.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 3/1/24.
//

import UIKit

// MARK: - Local Notification
extension LocalNotificationsViewController {
    // MARK: - Request Authorization
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Granted Authorization")
            } else {
                self.openAppSettings()
            }
        }
    }
    
    func dispatchProvisionalNotification() {
        #warning("Implement provisional notificiation")
        
        Task {
            do {
                try await notificationCenter.requestAuthorization(options: [.alert, .sound, .badge, .provisional])
                
            } catch {
                print("Task's Error")
            }
            
            
            // Obtain the notification settings.
            let settings = await notificationCenter.notificationSettings()
            
            // Verify the authorization status.
            guard settings.authorizationStatus == .provisional else { return }
            
            if settings.alertSetting == .enabled {
                // Schedule an alert-only notification.
                dispatchNotification()
            } else {
                // Schedule a notification with a badge and sound.
                dispatchNotification()
            }
        }
    }
    
    // MARK: - Check For Permission
    func checkForPermission(dispatchActions: Bool) {
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                if dispatchActions {
                    self.requestAuthorization()
                }
                print("Authorization Status: Not Determined")
                self.status = "Not Determined"
                
            case .denied:
                if dispatchActions {
                    // UI Updates made on extensions must be wrapped on the main Queue
                    DispatchQueue.main.async { [unowned self] in
                        self.present(self.alertController, animated: true)
                    }
                }
                print("Authorization Status: Denied")
                self.status = "Denied"
                
            case .authorized:
                if dispatchActions {
                    self.dispatchNotification()
                }
                print("Authorization Status: Authorized")
                self.status = "Authorized"
                
            case .provisional:
                if dispatchActions {
                    self.requestAuthorization()
                }
                print("Authorization Status: Provisional")
                self.status = "Provisional"
            case .ephemeral:
                print("Authorization Status: Ephemeral")
                self.status = "Ephemeral"
            @unknown default:
                self.status = "@unknown"
                print("Authorization Status: @unknown")
            }
        }
    }
    
    func dispatchNotification() {
        
        let identifier = "Some Identifier"
        
        let title = "Some Title"
        let subTitle = "Some SubTitle"
        let body = "Some Notification Body"
        let hour = 0
        let minute = 23
        let isDaily = true
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subTitle
        content.body = body
        content.badge = 1
        content.sound = .default
        
        let openAction = UNNotificationAction(identifier: "open", title: "Open", options: .foreground)
        let performAction = UNNotificationAction(identifier: "perform", title: "Perform", options: .foreground)
        let cancelAction = UNNotificationAction(identifier: "cancel", title: "Cancel", options: .destructive)
        
        let categories = UNNotificationCategory(identifier: "action", actions: [openAction, performAction ,cancelAction], intentIdentifiers: [])
        
        notificationCenter.setNotificationCategories([categories])
        
        content.categoryIdentifier = "action"
        
        let calendar = Calendar.current
        var dateComponent = DateComponents(calendar: calendar, timeZone: .current)
        dateComponent.hour = hour
        dateComponent.minute = minute
        
        // Calendar - to do
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDaily)
        
        // Timer
        let timeIntervalrtrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        
        
        // Location - to do
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: timeIntervalrtrigger)
        
//        notificationCenter.removeDeliveredNotifications(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }
    
    // MARK: - Open App Settings
    func openAppSettings() {
        if let bundleIdentifier = Bundle.main.bundleIdentifier,
            let appSettingsURL = URL(string: UIApplication.openSettingsURLString + bundleIdentifier) {
            if UIApplication.shared.canOpenURL(appSettingsURL) {
                UIApplication.shared.open(appSettingsURL, options: [:], completionHandler: nil)
            }
        }
    }
    
}

