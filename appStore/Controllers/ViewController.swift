//
//  ViewController.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 10/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MobileApp.sharedInstance.showItems(nil) { (fail) in
            AppNotification.show(nil, subtitle: "i guess something it´s happening")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        //AppNotification.show(nil, subtitle: "i guess something it´s happening")
    }    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

