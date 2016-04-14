//
//  ItemsCollectionViewCell.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 13/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit
import Haneke

class ItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    var item: AppItem? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI(){
        itemLabel.text = item?.name
        self.itemImageView.hnk_setImageFromURL(NSURL(string:(item?.image)!))
    }
    

}