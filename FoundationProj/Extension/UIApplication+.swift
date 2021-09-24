//
//  UIApplication+.swift
//  FoundationProj
//
//  Created by baedy on 2020/05/29.
//  Copyright © 2020 baedy. All rights reserved.
//

import UIKit

extension UIApplication {
    public var topViewController: UIViewController? {
        var topViewController = keyWindowInConnectedScenes?.rootViewController
        while topViewController?.presentedViewController != nil {
            topViewController = topViewController?.presentedViewController
        }
        return topViewController is UINavigationController ? (topViewController as! UINavigationController).topViewController : topViewController
    }

    @available(iOS 13.0, *)
     var windowScene: UIWindowScene? {
         return connectedScenes
             .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
     }

     var keyWindowInConnectedScenes: UIWindow? {
         if #available(iOS 13.0, *) {
             return windowScene?.windows
                 .first(where: { $0.isKeyWindow })
         } else {
             return UIApplication.shared.keyWindow
         }
     }
}
