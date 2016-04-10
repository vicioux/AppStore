//
//  AppItem.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import ObjectMapper

class AppItem : Mappable {
    
    var name : String?
    var category : String?
    var summary : String?
    var price : String?
    var image : String?
    var releaseDate : String?
    var link : String?
    
    init(){}
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        name <- map["im:name.label"]
        category <- map["category.attributes.label"]
        summary <- map["summary.label"]
        price <- map["im:price.attributes.amount"]
        image <- map["im:image.0.label"]
        releaseDate <- map["im:releaseDate.label"]
        link <- map["link.attributes.href"]
    }
    
}