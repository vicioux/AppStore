//
//  CategoryCollectionViewCell.swift
//  appStore
//
//  Created by Sergio Orozco Builes on 13/04/16.
//  Copyright © 2016 vicioux. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
 
    var categoryName: String?{
        didSet{
            updateUI()
        }
    }
 
    func updateUI() {
        categoryLabel.text = categoryName
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
