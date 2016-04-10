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
    
    func findApps(completion: (success: [AppItem]!, fail: NSError!) -> Void) {
        
        Alamofire.request(.GET,APIClient.getUrl("us/rss/topfreeapplications/limit=20/json"), encoding: .JSON).validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            switch response.result {
                
            case let .Success(valueJSON):
                let items = Mapper<AppItem>().mapArray(valueJSON["feed"]!?["entry"])
                completion(success: items, fail: nil)
                
            case .Failure(let alamoFireError):
                completion(success: nil, fail: alamoFireError)
                
            }
            
        }
        
    }
}