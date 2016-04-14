//
//  Error.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 11/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation


enum APIError: ErrorType, CustomStringConvertible {
    
    case NoInternet
    case HTTPError(statusCode: Int)
    case ServerError(message: String)
    case NoResponse()
    case UnknownError(statusCode: Int)
    case URLErrorDomain()
    case NotFoundData()
    
    var description: String {
        switch self {
        case .NoInternet:
            return "There is no internet connection."
        case .HTTPError(let statusCode):
            return "The call failed with HTTP code \(statusCode)."
        case .ServerError(let message):
            return "The server responded with message \"\(message)\"."
        case .NoResponse():
            return "Operation Response was nil"
        case .UnknownError(let statusCode):
            return "The server responded with an unknown error code \(statusCode)"
        case .URLErrorDomain():
            return "invalid Domain"
        case .NotFoundData():
            return "Data not found"
        }
        
    }
}

class Error {
    
    static func ErrorFromAlamofire(operation: NSError?) -> APIError {
        let code = operation?.code
        
        guard let _ = operation else {
            return APIError.NoResponse()
        }
        
        if code == -1001 {
            return APIError.HTTPError(statusCode: code!)
        }
        
        if code == -1003 {
            return APIError.URLErrorDomain()
        }
        
        return APIError.UnknownError(statusCode: code!)
    }
}