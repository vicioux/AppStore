//
//  CategoryViewController.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 13/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private struct Identifier
    {
        static let categoryTableCell = "CategoryTableViewCell"
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let categorySegue =  "ShowByCategory"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Category"
        
        let categoryTableNib = UINib(nibName: Identifier.categoryTableCell, bundle: nil)
        self.categoryTableView.registerNib(categoryTableNib, forCellReuseIdentifier: Identifier.categoryTableCell)
        
        let categoryCollectionNib = UINib(nibName: Identifier.categoryCollectionViewCell, bundle: nil)
        self.categoryCollectionView.registerNib(categoryCollectionNib, forCellWithReuseIdentifier: Identifier.categoryCollectionViewCell)
        
        MobileApp.sharedInstance.showCategories { (fail) in
            if (fail != nil){
                AppNotification.show(nil, subtitle: "i guess something it´s happening")
            } else {
                self.categoryTableView.reloadData()
            }
        }
        
    }

}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MobileApp.sharedInstance.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: CategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier(Identifier.categoryTableCell) as! CategoryTableViewCell
        cell.categoryName = MobileApp.sharedInstance.categories[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let categoryName = MobileApp.sharedInstance.categories[indexPath.row]
        MobileApp.sharedInstance.showItems(categoryName) { (fail) in
            if (fail != nil){
                AppNotification.show(nil, subtitle: "i guess something it´s happening")
            } else {
               self.performSegueWithIdentifier(Identifier.categorySegue, sender: nil)
            }
        }
    }
    
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MobileApp.sharedInstance.categories.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifier.categoryCollectionViewCell, forIndexPath: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryName = MobileApp.sharedInstance.categories[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let categoryName = MobileApp.sharedInstance.categories[indexPath.row]
        MobileApp.sharedInstance.showItems(categoryName) { (fail) in
            if (fail != nil){
                AppNotification.show(nil, subtitle: "i guess something it´s happening")
            } else {
                self.performSegueWithIdentifier(Identifier.categorySegue, sender: nil)
            }
        }
    }
}




