//
//  AppItem.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class AppItem : Object,Mappable {
    
    dynamic var name : String?
    dynamic var category : String?
    dynamic var summary : String?
    dynamic var price : String?
    dynamic var image : String?
    dynamic var releaseDate : String?
    dynamic var link : String?
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    //Impl. of Mappable protocol
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        name <- map["im:name.label"]
        category <- map["category.attributes.label"]
        summary <- map["summary.label"]
        price <- map["im:price.attributes.amount"]
        image <- map["im:image.2.label"]
        releaseDate <- map["im:releaseDate.label"]
        link <- map["link.attributes.href"]
    }
    
    func getItemImage() -> UIImage{
        let url = NSURL(string:(self.image)!)
        let data = NSData(contentsOfURL: url!)
        return  UIImage(data: data!)!
    }
    
}