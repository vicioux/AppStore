//
//  ItemsCollectionViewCell.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 13/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit

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
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_async(dispatch_get_main_queue(), {
                self.itemImageView.image = self.item?.getItemImage()
            });
        }
    }
    

}