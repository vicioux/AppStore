//
//  RepositoryLocator.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation

class RepositoryLocator {
    static let sharedInstance = RepositoryLocator()
    
    class var sharedDispatchInstance: RepositoryLocator {
        
        struct Stactic {
            
            static var onceToken:dispatch_once_t = 0
            
            static var instance: RepositoryLocator? = nil
            
        }
        
        dispatch_once(&Stactic.onceToken) {
            
            Stactic.instance = RepositoryLocator()
            
        }
        
        return Stactic.instance!
        
    }
    
    func appRepository() -> IAppRepository{

        if (Constants.useTestRepo) {
            return TestAppRepository.sharedInstance
        } else {
            return AppRepository.sharedInstance
        }
        
    }
}