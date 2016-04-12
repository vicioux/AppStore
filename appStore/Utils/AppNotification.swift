//
//  AppNotification.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 12/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import BRYXBanner

class AppNotification {
    
    static func show(error:APIError?, title:String = "Oh snap", subtitle: String, type: UIColor = NotificationType.Info.color ) -> Void {
        
        if error != nil {
            let banner = Banner(title: title, subtitle: error?.description, image: nil, backgroundColor: NotificationType.Error.color)
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
        } else {
            let banner = Banner(title: title, subtitle: subtitle, image: nil, backgroundColor: type)
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
        }
        
    }
}

enum NotificationType {
    case Error
    case Success
    case Warning
    case Info
    
    var color: UIColor {
        switch self {
        case .Error: return UIColor(red:198.0/255.0, green:26.00/255.0, blue:27.0/255.0, alpha:1.000)
        case .Success: return UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000)
        case .Warning: return UIColor(red:255.0/255.0, green:204.0/255.0, blue:51.0/255.0, alpha:1.000)
        case .Info: return UIColor(red:31.0/255.0, green:136.0/255.0, blue:255.0/255.0, alpha:1.000)
        }
    }
}
