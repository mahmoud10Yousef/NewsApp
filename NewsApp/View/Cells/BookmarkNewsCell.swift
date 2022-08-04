//
//  BookmarkNewsCell.swift
//  NewsApp
//
//  Created by mahmoud yousef on 04/08/2022.
//

import UIKit

class BookmarkNewsCell: UITableViewCell {
 
    
    static let reuseID = "BookmarkNewsCell"
    
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
