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
    
    private struct Identifier
    {
        static let categoryTableCell = "CategoryTableViewCell"
        static let segue =  "ShowByCategory"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Category"
        
        let nib = UINib(nibName: Identifier.categoryTableCell, bundle: nil)
        self.categoryTableView.registerNib(nib, forCellReuseIdentifier: Identifier.categoryTableCell)
        
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
        self.performSegueWithIdentifier(Identifier.segue, sender: nil)
    }
    
}
