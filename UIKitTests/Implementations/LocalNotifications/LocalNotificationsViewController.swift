//
//  LocalNotificationsViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 2/28/24.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class LocalNotificationsViewController: UIViewController {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    
    let button = UIButton(type: .roundedRect)
    let provisionalNotificationButton = UIButton(type: .system)
    let infoLabel = UILabel()
    
    var status = "Placeholder"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        registerToNotificationCenter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkForPermission(dispatchActions: false)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Local Notifications"
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
