//
//  NewsBannerCell.swift
//  NewsApp
//
//  Created by mahmoud yousef on 03/08/2022.
//

import UIKit

class NewsBannerCell: UICollectionViewCell {
    
    static let reuseID = "NewsBannerCell"
    
    @IBOutlet weak var newsPublishedTimeLabel: UILabel!
    @IBOutlet weak var newsTilteLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 15
    }

    
}
