//
//  MobileApp.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation


class MobileApp: NSObject {
    
    static let sharedInstance = MobileApp()
    var context: RepositoryLocator;
    var items: [AppItem]!
    var currentItem: AppItem!
    
    required override init() {
        context = RepositoryLocator.sharedInstance
    }
    
    func showItems(completion: (success: [AppItem]!, fail: NSError!) -> Void) {
        context.securityRepository().findApps { [weak self] (success, fail) in
            
            if fail != nil{
                completion (success: nil, fail: fail)
            } else {
                self!.items = success;
                completion (success: success, fail: nil)
            }
        
        }
    }
}