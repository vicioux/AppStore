//
//  APIClient.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration

class APIClient: Manager {

    static let ApiBaseUrl = "https://itunes.apple.com/"
    
    class func getUrl(urlPart:String) -> String {
        return ApiBaseUrl + urlPart;
    }
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}

extension Request {
    public func responseResultObject(queue: dispatch_queue_t? = nil,
                                   options: NSJSONReadingOptions = .AllowFragments,
                         completionHandler: (NSURLRequest, Response<AnyObject, NSError>) -> Void) -> Self { return response(queue: queue,
                                                    responseSerializer: Request.JSONResponseSerializer(options: options),
                                                     completionHandler: { (response) -> Void in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                
                
                dispatch_async(queue ?? dispatch_get_main_queue(), {
                    completionHandler(response.request!, response)
                })
            })
        })
    }}