//
//  LatestNewsCell.swift
//  NewsApp
//
//  Created by mahmoud yousef on 03/08/2022.
//

import UIKit

class LatestNewsCell: UICollectionViewCell {
   
    static let reusueID = "LatestNewsCell"
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsPublishedTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor  = UIColor.lightGray.cgColor
        contentView.layer.borderWidth  = 0.5
    }
    

}
