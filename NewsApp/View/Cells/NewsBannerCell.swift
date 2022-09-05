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
 
    
    func configureCell(publishedTime: String , title : String , imageUrl : String){
        newsImageView.setImage(with: imageUrl)
        newsTilteLabel.text = title
        newsPublishedTimeLabel.text = publishedTime.convertToDisplayFormat()
    }
    
}
