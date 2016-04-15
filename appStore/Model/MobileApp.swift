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
    
    class var sharedDispatchInstance: MobileApp {
        
        struct Stactic {
            
            static var onceToken:dispatch_once_t = 0
            
            static var instance: MobileApp? = nil
            
        }
        
        dispatch_once(&Stactic.onceToken) {
            
            Stactic.instance = MobileApp()
            
        }
        
        return Stactic.instance!
        
    }
    
    
    
    var context: RepositoryLocator;
    var items: [AppItem]!
    var currentItem: AppItem!
    var categories:[String]!
    
    required override init() {
        context = RepositoryLocator.sharedInstance
    }
    
    func showItems(category:String!, completion:(fail: APIError!) -> Void) {
        
        var categoryName:String? = nil
        
        if category != Constants.allCategories {
            categoryName = category;
        }
        
        context.appRepository().findApps(categoryName) { [weak self] (success, error) in
            
            if (success != nil && success.count > 0) {
                self!.items = success
            }
            
            completion(fail: error)
        }
    }
    
    func showCategories(completion:(fail: NSError!) -> Void) {
        context.appRepository().findCategories { [weak self] (success, error) in
            
            if (success != nil && success.count > 0) {
                self!.categories = success
            }
            
            completion(fail: error)
        }
    }
    
    func selectCurrentItem(index:Int) -> Void {
        if (self.items != nil && index < self.items.count ) {
            self.currentItem = self.items[index]
        }
    }
    
    func sycn(completion:(fail: APIError!) -> Void) {
        context.appRepository().syncItems { (success, fail) in
            completion(fail: fail)
        }
    }
    
    
}