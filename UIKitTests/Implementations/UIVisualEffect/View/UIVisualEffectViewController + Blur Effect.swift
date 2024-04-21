//
//  UIVisualEffectViewController + Blur Effect.swift
//  UIKitTests
//
//  Created by Brandon Suarez on 4/19/24.
//

import UIKit

// MARK: - Handle All Blur Effect components
extension UIVisualEffectViewController {
    
    func setupBlurEffectView(style: UIBlurEffect.Style) -> UIVisualEffectView {
        let visualEffectView = createBlurViewWith(style: style)
        embedLabelIn(view: visualEffectView, for: style)
        embedMenuButtonIn(view: visualEffectView)
        return visualEffectView
    }
    
    private func createBlurViewWith(style: UIBlurEffect.Style) -> UIVisualEffectView{
        let visualEffectView = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: style)
        visualEffectView.effect = blurEffect
        
        view.addSubview(visualEffectView)
        
        return visualEffectView
    }
    
    func embedLabelIn(view: UIView, for blurStyle: UIBlurEffect.Style) {
        
        let label = UILabel()
        label.text = "Effect - " + getBlurStyleString(from: blurStyle)
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .body)
        label.tag = 1
        
        let containerView = UIView()
        containerView.tag = 0
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
    
    func getBlurStyleString(from style: UIBlurEffect.Style) -> String {
        switch style {
        case .extraLight:
            return ".extraLight"
        case .light:
            return ".light"
        case .dark:
            return ".dark"
        case .extraDark:
            return ".extraDark"
        case .regular:
            return ".regular"
        case .prominent:
            return ".prominent"
        case .systemUltraThinMaterial:
            return ".systemUltraThinMaterial"
        case .systemThinMaterial:
            return ".systemThinMaterial"
        case .systemMaterial:
            return ".systemMaterial"
        case .systemThickMaterial:
            return ".systemThickMaterial"
        case .systemChromeMaterial:
            return ".systemChromeMaterial"
        case .systemUltraThinMaterialLight:
            return ".systemUltraThinMaterialLight"
        case .systemThinMaterialLight:
            return ".systemThinMaterialLight"
        case .systemMaterialLight:
            return ".systemMaterialLight"
        case .systemThickMaterialLight:
            return ".systemThickMaterialLight"
        case .systemChromeMaterialLight:
            return ".systemChromeMaterialLight"
        case .systemUltraThinMaterialDark:
            return ".systemUltraThinMaterialDark"
        case .systemThinMaterialDark:
            return ".systemThinMaterialDark"
        case .systemMaterialDark:
            return ".systemMaterialDark"
        case .systemThickMaterialDark:
            return ".systemThickMaterialDark"
        case .systemChromeMaterialDark:
            return ".systemChromeMaterialDark"
        @unknown default:
            return ".@unknown"
        }
    }
    
    // Menu Button
    func embedMenuButtonIn(view: UIVisualEffectView) {
        let button = UIButton(type: .system)
        button.setImage(.init(systemName: "plus.app"), for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 6
        
        button.showsMenuAsPrimaryAction = true
        let menu = createMenuFor(view: view)
        button.menu = menu
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.contentView.addSubview(button)
        NSLayoutConstraint.activate([
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12)
        ])
    }
    
    func createMenuFor(view: UIVisualEffectView) -> UIMenu {
        
        // Common Blur Effect
        let extraLightAction = UIAction(title: "ExtraLight") { [unowned self] _  in
            self.updateBlurEffectWith(style: .extraLight, to: view)
        }
        let lightAction = UIAction(title: "Light") { [unowned self] _  in
            self.updateBlurEffectWith(style: .light, to: view)
        }
        let darkAction = UIAction(title: "Dark") { [unowned self] _  in
            self.updateBlurEffectWith(style: .dark, to: view)
        }
        let regularAction = UIAction(title: "Regular") { [unowned self] _  in
            self.updateBlurEffectWith(style: .regular, to: view)
        }
        let prominentAction = UIAction(title: "Prominent") { [unowned self] _  in
            self.updateBlurEffectWith(style: .prominent, to: view)
        }
        
        let commonBlurMenu = UIMenu(title: "Common", children: [
            extraLightAction, 
            lightAction,
            darkAction,
            regularAction,
            prominentAction
        ])
        
        //  System Material A
        
        let systemUltraThinMaterial = UIAction(title: "UltraThinMaterial") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemUltraThinMaterial, to: view)
        }
        let systemThinMaterial = UIAction(title: "ThinMaterial") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemThinMaterial, to: view)
        }
        let systemMaterial = UIAction(title: "Material") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemMaterial, to: view)
        }
        let systemThickMaterial = UIAction(title: "ThickMaterial") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemThickMaterial, to: view)
        }
        let systemChromeMaterial = UIAction(title: "ChromeMaterial") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemChromeMaterial, to: view)
        }
        
        let systemMaterialMenuA = UIMenu(title: "System Material A", children: [
            systemUltraThinMaterial,
            systemThinMaterial,
            systemMaterial,
            systemThickMaterial,
            systemChromeMaterial
        ])
        
        // System Material B
        
        let systemUltraThinMaterialLight = UIAction(title: "UltraThinMaterialLight") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemUltraThinMaterialLight, to: view)
        }
        let systemThinMaterialLight = UIAction(title: "ThinMaterialLight") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemThinMaterialLight, to: view)
        }
        let systemMaterialLight = UIAction(title: "MaterialLight") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemMaterialLight, to: view)
        }
        let systemThickMaterialLight = UIAction(title: "ThickMaterialLight") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemThickMaterialLight, to: view)
        }
        let systemChromeMaterialLight = UIAction(title: "ChromeMaterialLight") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemChromeMaterialLight, to: view)
        }
        
        let systemMaterialMenuB = UIMenu(title: "System Material B", children: [
            systemUltraThinMaterialLight,
            systemThinMaterialLight,
            systemMaterialLight,
            systemThickMaterialLight,
            systemChromeMaterialLight
        ])
        
        // System Material C
        
        let systemUltraThinMaterialDark = UIAction(title: "UltraThinMaterialDark") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemUltraThinMaterialDark, to: view)
        }
        let systemThinMaterialDark = UIAction(title: "ThinMaterialDark") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemThinMaterialDark, to: view)
        }
        let systemMaterialDark = UIAction(title: "MaterialDark") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemMaterialDark, to: view)
        }
        let systemThickMaterialDark = UIAction(title: "ThickMaterialDark") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemThickMaterialDark, to: view)
        }
        let systemChromeMaterialDark = UIAction(title: "ChromeMaterialDark") { [unowned self] _  in
            self.updateBlurEffectWith(style: .systemChromeMaterialDark, to: view)
        }
        
        let systemMaterialMenuC = UIMenu(title: "System Material C", children: [
            systemUltraThinMaterialDark,
            systemThinMaterialDark,
            systemMaterialDark,
            systemThickMaterialDark,
            systemChromeMaterialDark
        ])
        
        let menu = UIMenu(title: "Blur Styles", children: [
            commonBlurMenu,
            systemMaterialMenuA,
            systemMaterialMenuB,
            systemMaterialMenuC
        ])
        
        return menu
    }
    
    @MainActor
    func updateBlurEffectWith(style: UIBlurEffect.Style, to view: UIVisualEffectView) {
        let blurEffect = UIBlurEffect(style: style)
        view.effect = blurEffect
        
        let containerView = view.contentView.subviews.first { view in
            view.tag == 0
        }
        
        let label = containerView?.subviews.first(where: { view in
            view.tag == 1
        }) as? UILabel
        
        label?.text = "Effect - " + getBlurStyleString(from: style)
    }
}
