//
//  TestAppRepository.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation

class TestAppRepository : IAppRepository{

    static let sharedInstance = AppRepository()
    
    func findApps(completion: (success: [AppItem]!, fail: NSError!) -> Void) {
        
    }

}