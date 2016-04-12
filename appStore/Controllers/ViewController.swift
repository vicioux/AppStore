//
//  ViewController.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*do {
            try tError()
        } catch {
            print("error inside a throws")
            return
        }*/
        
        /*MobileApp.sharedInstance.showItems(nil){ (fail) in
            let items = MobileApp.sharedInstance.items
            for item in items {
                print("\(item.name)")
            }
        }*/
        
        /*MobileApp.sharedInstance.showCategories({ (fail) in
            let items = MobileApp.sharedInstance.categories
            for item in items {
                print("\(item)")
            }
        })*/
    }
    
    /*func tError() throws {
        throw APIError.URLErrorDomain()
    }*/
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

