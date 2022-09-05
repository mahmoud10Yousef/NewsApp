//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by mahmoud yousef on 04/09/2022.
//

import Foundation
import RxSwift
import RxCocoa

class NewsViewModel{
    
    var loadingBehavior    = BehaviorRelay<Bool>(value: false)
    var topNewsSubjects    = PublishSubject<[Article]>()
    var latestNewsSubjects = PublishSubject<[Source]>()
    func getTopBannerNews(){
        
        loadingBehavior.accept(true)
    
        NetworkManager.shared.fetchData(url:"https://newsapi.org/v2/top-headlines?country=eg&apiKey=db71d97193dd453db7fec98cd40a1290", decodable: News.self) {
            
            [weak self] result in
            
            self?.loadingBehavior.accept(false)
            
            switch result{
                
            case .success(let topNews):
                self?.topNewsSubjects.onNext(topNews.articles)
            case .failure(let error):
                self?.topNewsSubjects.onError(error.rawValue as! Error)
            }
        }
    }
    
    func getLatestnews(){
        loadingBehavior.accept(true)
    
        NetworkManager.shared.fetchData(url:"https://newsapi.org/v2/top-headlines/sources?id=the-next-web&apiKey=db71d97193dd453db7fec98cd40a1290", decodable: LatestNews.self) {
            
            [weak self] result in
            
            self?.loadingBehavior.accept(false)
            
            switch result{
                
            case .success(let latestNews):
                self?.latestNewsSubjects.onNext(latestNews.sources)
            case .failure(let error):
                self?.latestNewsSubjects.onError(error.rawValue as! Error)
            }
        }
    }
}
