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
    
    private struct Identifier
    {
        static let CellIdentifier = "ItemCell"
        static let ShowDetail = "ShowDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (CGRectGetWidth(collectionView!.frame) - leftAndRigthPadding) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width + heigthAjustment)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        let titleColor = UIColor(red: 245.0 / 255.0, green: 0 / 255.0, blue: 145.0 / 255.0, alpha: 1.0)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: titleColor]
        nav?.translucent = false
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if MobileApp.sharedInstance.items != nil {
            return MobileApp.sharedInstance.items.count
        }
        
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifier.CellIdentifier, forIndexPath: indexPath) as! ItemsCollectionViewCell
        
        cell.item = MobileApp.sharedInstance.items[indexPath.row]
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        MobileApp.sharedInstance.selectCurrentItem(indexPath.row)
        self.performSegueWithIdentifier(Identifier.ShowDetail, sender: self)
    }
    
}
