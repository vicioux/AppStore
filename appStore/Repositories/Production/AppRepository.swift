//
//  AppRepository.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RealmSwift

class AppRepository : IAppRepository {
    
    static let sharedInstance = AppRepository()
    
    func findApps(category: String!, completion: (success: [AppItem]!, fail: APIError!) -> Void) {
    
        let realm = try! Realm()
        var realmItems = realm.objects(AppItem)
        
        
        if category != nil{
            let predicate = NSPredicate(format: "category = %@", category)
            realmItems = realm.objects(AppItem).filter(predicate)
        }
        
        if (realmItems.count > 0) {
            let items = Array(realmItems)
            completion(success: items, fail: nil)
        } else {
            completion(success: nil, fail: APIError.NotFoundData())
        }
        
    }
    
    func syncItems(completion: (success: [AppItem]!, fail: APIError!) -> Void) {
        SyncManager.sharedInstance.downloadData { (success, fail) in
            completion(success: success, fail: fail)
        }
    }
 
    func findCategories(completion: (success: [String]!, fail: NSError!) -> Void) {
        let categories = ["All Categories", "Games", "Photo & Video", "Social Networking", "Education", "Music", "Navigation", "Travel"]
        completion(success: categories, fail: nil)
    }
    
}