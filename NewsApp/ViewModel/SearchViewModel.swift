//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by mahmoud yousef on 10/09/2022.
//

import Foundation
import RxSwift
import RxRelay

class SearchViewModel{
    
    var textBehavior          = BehaviorRelay<String>(value: "")
    var loadingBehavior       = BehaviorRelay<Bool>(value: false)
    var searchingNewsSubjects = PublishSubject<[Article]>()
    
    var isTextValid: Observable<Bool> {
        return textBehavior.asObservable().map {(text) -> Bool in
            return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    }
    
    
    func getSearchingNews(){
        self.loadingBehavior.accept(true)
        NetworkManager.shared.fetchData(url: "https://newsapi.org/v2/everything?q=\(textBehavior.value)&apiKey=db71d97193dd453db7fec98cd40a1290"
                                        , decodable: News.self) { [weak self] result in
            self?.loadingBehavior.accept(false)
            switch result{
                
            case .success(let news):
                self?.searchingNewsSubjects.onNext(news.articles)
            case .failure(let error):
                self?.searchingNewsSubjects.onError(error.rawValue as! Error)
            }
            
        }
    }
}
