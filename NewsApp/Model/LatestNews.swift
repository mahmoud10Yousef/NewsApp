//
//  LatestNews.swift
//  NewsApp
//
//  Created by mahmoud yousef on 05/09/2022.
//

import Foundation

struct LatestNews: Codable {
    let sources: [Source]
}


struct Source: Codable {
    let  name, description: String
    let url: String
    let language, country: String

   
}
