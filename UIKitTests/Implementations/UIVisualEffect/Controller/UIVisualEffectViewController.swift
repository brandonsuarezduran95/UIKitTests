//
//  UIVisualEffectViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/12/24.
//

import UIKit

class UIVisualEffectViewController: UIViewController {
    
    let imageView = UIImageView()
    let segmentedControl = UISegmentedControl(items: ["Blur Effect", "Vibrancy Effect"])
    let notificationCenter = NotificationCenter.default
    
    let stackView = UIStackView()
    
    lazy var visualEffectViewA = setupBlurEffectView(style: .extraLight)
    
    lazy var visualEffectViewB = setupBlurEffectView(style: .light)
    
    lazy var visualEffectViewC = setupBlurEffectView(style: .dark)
    
    var didPressShowHideButton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToNotificationCenter()
        setupController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addArrangeSubviews()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "UIVisualEffect"
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
        notificationCenter.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
}

// MARK: - Implementation
extension UIVisualEffectViewController {
    
    // Subscribe to Notification Center
    func subscribeToNotificationCenter() {
        notificationCenter.addObserver(self, selector: #selector(didChangeOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    // Handle Orientation
    @objc func didChangeOrientation(_ notification: Notification) {
        print(notification)
        if UIDevice.current.orientation.isPortrait && UIDevice.current.orientation != .portraitUpsideDown {
            let image = UIImage(named: "portraitLightBulb")
            imageView.image = image
        } else {
            let image = UIImage(named: "landscapeLightBulb")
            imageView.image = image
        }
    }
    
    // Hide/Show Effect
    @objc func presentEffectView() {

        if (didPressShowHideButton && stackView.layer.opacity == 0.0) {
            UIView.animate(withDuration: 1) { [unowned self] in
                self.stackView.layer.opacity = 1.0
            }
        } else  {
            UIView.animate(withDuration: 1) { [unowned self] in
                self.stackView.layer.opacity = 0.0
            }
        }
        didPressShowHideButton.toggle()
    }
    
    // Present Sheet Controller
    @objc func showInformationSheet() {
        var controller: UIViewController?
        
        if segmentedControl.selectedSegmentIndex == 0 {
            controller = SheetNavigationController(message: Constants.blurEffectMessage, title: "Blur Effect")
        } else {
            controller = SheetNavigationController(message: Constants.vibrancyEffectMessage, title: "Vibrancy Effect")
        }
        
        if let sheetController = controller?.sheetPresentationController {
            sheetController.detents = [.medium(), .large()]
            sheetController.prefersGrabberVisible = true
        }
        
        guard let viewController = controller else { return }
        self.present(viewController, animated: true)
    }
    
    @MainActor
    func handleBlurControlSection() {
        removeArrangeSubViews()
        visualEffectViewA = setupBlurEffectView(style: .extraLight)
        visualEffectViewB = setupBlurEffectView(style: .light)
        visualEffectViewC = setupBlurEffectView(style: .dark)
        addArrangeSubviews()
    }
    
    @MainActor
    func handleVibrancyControlSection() {
        removeArrangeSubViews()
        visualEffectViewA = setupVibrancyEffectView(blurEffect: .light, style: .fill)
        visualEffectViewB = setupVibrancyEffectView(blurEffect: .extraLight, style: .label)
        visualEffectViewC = setupVibrancyEffectView(blurEffect: .dark, style: .secondaryFill)
        addArrangeSubviews()
    }
    
    // Handle Control Change selection
    @objc func handleValueChangeInControlSelection(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 1) { [unowned self] in
            if sender.selectedSegmentIndex == 0 {
                self.handleBlurControlSection()
            } else {
                self.handleVibrancyControlSection()
            }
        }
    }
}


