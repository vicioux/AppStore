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

class AppRepository : IAppRepository {

    static let sharedInstance = AppRepository()
    
    func findApps(category: String!, completion: (success: [AppItem]!, fail: APIError!) -> Void) {
        
        Alamofire.request(.GET, APIClient.getUrl("us/rss/topfreeapplications/limit=20/json"), encoding: .JSON).validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            switch response.result {
                
            case let .Success(valueJSON):
                let items = Mapper<AppItem>().mapArray(valueJSON["feed"]!?["entry"])
                
                if category != nil {
                    let filteredItems = items!.filter() { $0.category == category}
                    completion(success: filteredItems, fail: nil)
                } else {
                    completion(success: items, fail: nil)
                }
        
            case .Failure(let alamoFireError):
                let error = Error.ErrorFromAlamofire(alamoFireError)
                completion(success: nil, fail: error)
            }
        }
        
    }
    
    func findCategories(completion: (success: [String]!, fail: NSError!) -> Void) {
        let categories = ["Games", "Photo & Video", "Social Networking", "Education", "Music", "Navigation", "Travel"]
        completion(success: categories, fail: nil)
    }
    
}