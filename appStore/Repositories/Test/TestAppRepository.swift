//
//  TestAppRepository.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation

class TestAppRepository : IAppRepository {

    static let sharedInstance = TestAppRepository()
    
    class var sharedDispatchInstance: TestAppRepository {
        
        struct Stactic {
            
            static var onceToken:dispatch_once_t = 0
            
            static var instance: TestAppRepository? = nil
            
        }
        
        dispatch_once(&Stactic.onceToken) {
            
            Stactic.instance = TestAppRepository()
            
        }
        
        return Stactic.instance!
        
    }
    
    func findApps(category: String!, completion: (success: [AppItem]!, fail: APIError!) -> Void) {
        //Create Dummy Code
    }
    
    func findCategories(completion: (success: [String]!, fail: NSError!) -> Void) {
        //Create Dummy Code
    }
    
    func syncItems(completion: (success: [AppItem]!, fail: APIError!) -> Void) {
        //Create Dummy Code
    }
    
}