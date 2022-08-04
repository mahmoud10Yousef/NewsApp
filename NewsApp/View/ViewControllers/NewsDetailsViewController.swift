//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by mahmoud yousef on 04/08/2022.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var newsPublishedTimeLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
  
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
    }
    
    
    
}
