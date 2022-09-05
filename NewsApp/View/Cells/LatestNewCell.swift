//
//  LatestNewCell.swift
//  NewsApp
//
//  Created by mahmoud yousef on 05/09/2022.
//

import UIKit

class LatestNewCell: UITableViewCell {

    static let reuseID = "LatestNewCell"
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsPublishedTimelabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
