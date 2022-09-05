//
//  UIImageView+Ext.swift
//  NewsApp
//
//  Created by mahmoud yousef on 05/09/2022.
//

import Foundation

import UIKit
import Kingfisher

extension UIImageView{
    func  setImage(with url : String){
        guard let url = URL(string: url) else { return }
        let placeHolderImage = UIImage(named: "news")
        kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: placeHolderImage, options: [.transition(.fade(1))])
    }
    
}
