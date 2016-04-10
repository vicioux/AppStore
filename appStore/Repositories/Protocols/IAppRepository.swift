//
//  IAppRepository.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation


protocol IAppRepository {
    
    func findApps(username: String , password: String ,completion:(success: [AppItem]!, fail: NSError!)-> Void)-> Void
}