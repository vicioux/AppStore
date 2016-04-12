//
//  TestAppRepository.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation

class TestAppRepository : IAppRepository {

    static let sharedInstance = AppRepository()
    
    func findApps(category: String!, completion: (success: [AppItem]!, fail: APIError!) -> Void) {
        //Create Dummy Code
    }
    
    func findCategories(completion: (success: [String]!, fail: NSError!) -> Void) {
        //Create Dummy Code
    }
    
}