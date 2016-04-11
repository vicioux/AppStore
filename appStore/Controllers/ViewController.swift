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
        
        MobileApp.sharedInstance.showItems("Education"){ (fail) in
            let items = MobileApp.sharedInstance.items
            for item in items {
                print("app Name \(item.name) app Category \(item.category)")
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

