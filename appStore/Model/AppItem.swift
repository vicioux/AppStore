//
//  AppItem.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import AlamofireJsonToObjects
import EVReflection

public class AppItem: BaseModel {
    
    var id : String!
    var username : String!
    var password : String!
    var apiToken : String!
    var fullName : String!
    
    var firstName : String!
    var lastName : String!
    var email : String!
    var bio : String!
    var status : String! = "active"
    var loginAt: CUnsignedLongLong!
    var createdAt: CUnsignedLongLong!
    var isSuperAdmin: Bool!
    var picture : String!
    
}