//
//  News.swift
//  NewsApp
//
//  Created by mahmoud yousef on 04/09/2022.
//

import Foundation

//struct News: Codable{
//    let title: String
//    let description : String
//    let urlToImage  : String?
//    let publishedAt : String
//}
//
//
//struct NewsModel:Codable{
//    let articles: [News]
//}


struct News: Codable {
    let articles: [Article]
}


struct Article: Codable {
    
    let title: String
    let articleDescription: String?
    
    let urlToImage: String?
    let publishedAt: String
    

    enum CodingKeys: String, CodingKey {
        case title
        case articleDescription = "description"
        case urlToImage, publishedAt
    }
}

