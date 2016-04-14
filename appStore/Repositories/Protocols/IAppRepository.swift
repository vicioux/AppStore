//
//  IAppRepository.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation


protocol IAppRepository {
    
    func findApps(category: String!,completion:(success: [AppItem]!, fail: APIError!)-> Void)-> Void
    
    func syncItems(completion: (success: [AppItem]!, fail: APIError!) -> Void) -> Void
    
    func findCategories(completion:(success: [String]!, fail: NSError!)-> Void)-> Void
}