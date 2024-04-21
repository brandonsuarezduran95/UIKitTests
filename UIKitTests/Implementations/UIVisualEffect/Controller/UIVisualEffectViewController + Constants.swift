//
//  UIVisualEffectViewController + Constants.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/13/24.
//

import Foundation

extension UIVisualEffectViewController {
    enum Constants {
        static let blurEffectMessage: String = "Tap the 'Eraser Button' to hide/present the blur effect\n\n\nIn order to create a Blur Effect, you first need to create a container for the effect, this container is called UIVisualEffectView, which works just as normal UIView, you create your blur effect with the UIBluerEffect class, and you must pass it on your UIVisualEffectView's instance effect property, you can also initialize it with it.\n\nIf you want to add views not affected by the blur effect, add them on the UIVisualEffectView's instance contentView, else they will be blurred as well"
        
        static let vibrancyEffectMessage: String = "vibrancyEffectMessage"
    }
}
