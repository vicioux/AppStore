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
    
    func securityRepository() -> IAppRepository{
        if(Constants.useTestRepo){
            return TestAppRepository.sharedInstance
        }else{
            return AppRepository.sharedInstance
        }
    }
}