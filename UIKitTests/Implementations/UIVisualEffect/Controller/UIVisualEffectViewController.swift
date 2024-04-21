//
//  UIVisualEffectViewController.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/12/24.
//

import UIKit
import Combine

class UIVisualEffectViewController: UIViewController {
    
    // UI Elements
    let imageView = UIImageView()
    let segmentedControl = UISegmentedControl(items: ["Blur Effect", "Vibrancy Effect"])
    let stackView = UIStackView()
    lazy var visualEffectViewA = setupBlurEffectView(style: .extraLight)
    lazy var visualEffectViewB = setupBlurEffectView(style: .light)
    lazy var visualEffectViewC = setupBlurEffectView(style: .dark)
    
    // Internal properties
    let notificationCenter = NotificationCenter.default
    var didPressShowHideButton: Bool = false
    
    /// Subscriber for device orientation
    var subscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubscriber()
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
        notificationCenter.removeObserver(self)
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
        subscriber?.cancel()
    }
}

// MARK: - Implementation
extension UIVisualEffectViewController {
    
    // Receive Orientation values from the NotificationCenter Publisher
    func setupSubscriber() {
        subscriber = notificationCenter
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .receive(on: RunLoop.main)
            .compactMap{ notification in
                return (notification.object as? UIDevice)?.orientation
            }.sink { [unowned self] orientation in
                    if orientation.isPortrait && orientation != .portraitUpsideDown {
                        let image = UIImage(named: "portraitLightBulb")
                        self.imageView.image = image
                    } else {
                        let image = UIImage(named: "landscapeLightBulb")
                        self.imageView.image = image
                    }
            }
    }
    
    // Hide/Show Effect
    @objc func toggleEffectView() {
        
        UIView.animate(withDuration: 1) { [unowned self] in
            if (didPressShowHideButton && stackView.layer.opacity == 0.0) {
                self.stackView.layer.opacity = 1.0
            } else  {
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
        visualEffectViewA = setupVibrancyEffectView(blur: .systemMaterial, style: .fill)
        visualEffectViewB = setupVibrancyEffectView(blur: .systemMaterial, style: .label)
        visualEffectViewC = setupVibrancyEffectView(blur: .systemMaterial, style: .tertiaryLabel)
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


