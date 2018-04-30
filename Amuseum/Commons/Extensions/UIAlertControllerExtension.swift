//
//  UIAlertControllerExtension.swift
//  Spike
//
//  Created by Serj Agopian on 4/7/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import UIKit

extension UIAlertController {
        
    /// Convenience initializer of UIAlertController. Useful for just confirming an alert with no cancel.
    ///
    /// - Parameters:
    ///   - title: The title of the alert
    ///   - alertControllerStyle: The style of the UIAlertController
    ///   - message: The message of the alert
    ///   - defaultActionButtonTitle: The default UIAlertActionTitle `Okay` by default localized
    ///   - tintColor: The tint color of the UIAlertController
    ///   - handler: The handler of the `Okay` UIAlertAction
    convenience init(title: String, message: String?, alertControllerStyle: UIAlertControllerStyle = .alert, defaultActionButtonTitle: String? = StringConstants.okay.localized, tintColor: UIColor? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        self.init(title: title, message: message, preferredStyle: alertControllerStyle)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: handler)
        addAction(defaultAction)
        if let color = tintColor {
            view.tintColor = color
        }
    }
    
    /// Convenience Intiializer of UIAlertController. Useful for passing as many actions as you want and all
    /// are added to the UIAlertController.
    ///
    /// - Parameters:
    ///   - title: The title of the alert
    ///   - actions: The UIAlertActions of the alert
    ///   - alertControllerStyle: The UIAlertControllerStyle of the alert
    ///   - message: The message of the alert optional
    ///   - tintColor: The tint color of the alert optional
    convenience init(title: String, actions: [UIAlertAction], alertControllerStyle: UIAlertControllerStyle = .alert, message: String?, tintColor: UIColor? = nil) {
        self.init(title: title, message: message, preferredStyle: alertControllerStyle)
        for action in actions {
            addAction(action)
        }
        if let color = tintColor {
            view.tintColor = color
        }
    }
    
    /// Convenience initializer of UIAlertController. Useful for initializing alert with an Error object.
    ///
    /// - Parameters:
    ///   - error: The Error object received
    ///   - title: The title of the alert. "Error" by default
    ///   - handler: The handler when the confirm button is pressed
    convenience init(error: Error, title: String = StringConstants.error.localized, handler: ((UIAlertAction) -> Void)? = nil) {
        self.init(title: title, message: error.localizedDescription, alertControllerStyle: .alert, handler: handler)
    }
    
    /// Creates new window and controller and presents the UIAlertController on that window
    ///
    /// - Parameters:
    ///   - animated: If the presentation should be animated
    ///   - completion: The completion of the presentation of the UIAlertController
    func showAlert(animated: Bool = true, completion: (() -> Void)? = nil) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = UIViewController()
        window.rootViewController = viewController
        window.windowLevel = UIWindowLevelAlert
        window.makeKeyAndVisible()
        viewController.present(self, animated: animated, completion: completion)
    }
    
}
