//
//  DetailViewController.swift
//  appStore
//
//  Created by Alejandro Orozco Builes on 13/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemCategory: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = MobileApp.sharedInstance.currentItem
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_async(dispatch_get_main_queue(), {
                self.itemImage.image = item.getItemImage()
            });
        }

        itemName.text = item.name!
        itemCategory.text = item.category!
        itemPrice.text = item.price!
        itemDescription.text = item.summary!
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}