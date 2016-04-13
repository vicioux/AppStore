//
//  ItemsCollectionViewController.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 12/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit

class ItemsCollectionViewController: UICollectionViewController {
    
    private let leftAndRigthPadding: CGFloat = 32.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heigthAjustment: CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (CGRectGetWidth(collectionView!.frame) - leftAndRigthPadding) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width + heigthAjustment)
        
        MobileApp.sharedInstance.showItems(nil) { (fail) in
            if (fail != nil){
                AppNotification.show(nil, subtitle: "i guess something it´s happening")
            } else {
                self.collectionView?.reloadData()
            }
        }
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    private struct StoryBoard
    {
        static let CellIdentifier = "ItemCell"
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if MobileApp.sharedInstance.items != nil {
            return MobileApp.sharedInstance.items.count
        }
        
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(StoryBoard.CellIdentifier, forIndexPath: indexPath) as! ItemsCollectionViewCell
        
        cell.item = MobileApp.sharedInstance.items[indexPath.row]
        
        return cell
    }
}
