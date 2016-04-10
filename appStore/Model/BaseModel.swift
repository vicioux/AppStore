//
//  BaseModel.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import EVReflection
import AlamofireJsonToObjects

public class BaseModel: EVObject {
    
    public required init() {
        super.init()
    }
    
    required public init(json:String?) {
        super.init();
        let jsonDict = EVReflection.dictionaryFromJson(json)
        EVReflection.setPropertiesfromDictionary(jsonDict, anyObject: self)
    }
    
    
}