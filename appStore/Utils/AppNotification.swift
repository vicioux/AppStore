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
    
    static func show(error: ErrorType?, title:String, subtitle: String, type: String) -> Void {
        
        let banner = Banner(title: title, subtitle: subtitle, image: nil, backgroundColor: UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000))
        
        banner.dismissesOnTap = true
        banner.show(duration: 3.0)
    }
}

/*struct BannerColors {
 static let red = UIColor(red:198.0/255.0, green:26.00/255.0, blue:27.0/255.0, alpha:1.000)
 static let green = UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000)
 static let yellow = UIColor(red:255.0/255.0, green:204.0/255.0, blue:51.0/255.0, alpha:1.000)
 static let blue = UIColor(red:31.0/255.0, green:136.0/255.0, blue:255.0/255.0, alpha:1.000)
 }*/