//
//  DataManager.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 14/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RealmSwift

class SyncManager {

    static let sharedInstance = SyncManager()
    
    func downloadData(completion: (success: [AppItem]!, fail: APIError!) -> Void) {
        
        if !APIClient.isConnectedToNetwork() {
            completion(success: nil, fail: APIError.NoInternet)
        }
        
        APIClient.sharedInstance.request(.GET, APIClient.getUrl("us/rss/topfreeapplications/limit=20/json"), parameters: nil,
            encoding: .JSON).responseResultObject {
                (request, response) -> Void in
                switch response.result {
                    
                case let .Success(valueJSON):
                    let items = Mapper<AppItem>().mapArray(valueJSON["feed"]!?["entry"])
                    
                    let realm = try! Realm()
                    try! realm.write {
                        for item in items! {
                            realm.add(item,update: true)
                        }
                    }
                    completion(success: items, fail: nil)
                    
                case .Failure(let alamoFireError):
                    let error = Error.ErrorFromAlamofire(alamoFireError)
                    completion(success: nil, fail: error)
                }
        }
        
    }

}