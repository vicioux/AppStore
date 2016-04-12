//
//  APIClient.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import Alamofire

class APIClient: Manager {

    static let ApiBaseUrl = "https://itunes.apple.com/"
    
    class func getUrl(urlPart:String) -> String {
        return ApiBaseUrl + urlPart;
    }
}