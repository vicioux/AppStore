//
//  DetailViewController.swift
//  appStore
//
//  Created by Alejandro Orozco Builes on 13/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit
import Haneke


class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemCategory: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = MobileApp.sharedInstance.currentItem
        
        itemImage.hnk_setImageFromURL(NSURL(string:(item?.image)!))
        itemName.text = item.name!
        itemCategory.text = item.category!
        itemPrice.text = item.releaseDate!
        itemDescription.text = item.summary!
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}