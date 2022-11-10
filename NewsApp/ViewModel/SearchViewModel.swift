//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by mahmoud yousef on 09/11/2022.
//

import Foundation

import Foundation
import RxSwift
import RxRelay

class SearchViewModel {
    
    private  var newsModelSubject    = PublishSubject<[Article]>()
    private  var isTableHidden       = BehaviorRelay<Bool>(value: false)
    var searchValueBehavior          = BehaviorSubject<String?>(value: "")
    var loadingBehavior              = BehaviorRelay<Bool>(value: false)
    
    var newsSubjects: Observable<[Article]> { Observable.combineLatest(
        searchValueBehavior
            .map { $0 ?? "" }
            .startWith("")
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance),
        newsModelSubject
    )
            .map { searchValue, books in
                searchValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? books : books.filter { $0.title.lowercased().contains(searchValue.lowercased()) }
            }
    }
    
    
    func getSearchingNews(){
        self.loadingBehavior.accept(true)
        NetworkManager.shared.fetchData(url: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=db71d97193dd453db7fec98cd40a1290"
                                        , decodable: News.self) { [weak self] result in
            self?.loadingBehavior.accept(false)
            switch result{
                
            case .success(let news):
                self?.newsModelSubject.onNext(news.articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
