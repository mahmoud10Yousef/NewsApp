//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by mahmoud yousef on 04/08/2022.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    
    var newsImageUrl    :String?
    var newsDate        :String!
    var newsTitle       :String!
    var newsDescription :String?
    
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsPublishedTimeLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    private func populateData(){
        newsImageView.setImage(with: newsImageUrl!)
        newsPublishedTimeLabel.text = newsDate.convertToDisplayFormat()
        newsTitleLabel.text              = newsTitle
        newsDescriptionLabel.text   = newsDescription
        
    }
  
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
    }
    
    
    
}
