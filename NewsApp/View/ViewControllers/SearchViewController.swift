//
//  SearchViewController.swift
//  NewsApp
//
//  Created by mahmoud yousef on 04/08/2022.
//

import UIKit
import RxSwift
import RxCocoa
import ProgressHUD

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var  searchController = UISearchController()
    
    private let searchViewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureTableView()
        getSearchingNews()
        subscripeToLoadingView()
        subscribeToNewsSubjects()
        bindToSearchValue()
        subscripeToSearchNewsSelection()
    }
    
    
    private func configureSearchController(){
       // searchController.searchBar.delegate  = self
          searchController.searchBar.placeholder                = "Search for news by title"
          searchController.obscuresBackgroundDuringPresentation = false
          navigationItem.searchController                       = searchController
      }
    
    
    func bindToSearchValue() {
        searchController.searchBar.rx.text
            .bind(to: searchViewModel.searchValueBehavior)
            .disposed(by: disposeBag)
    }
    
    
    private func getSearchingNews(){
        searchViewModel.getSearchingNews()
    }
    
    
    private func subscripeToLoadingView(){
        searchViewModel.loadingBehavior.subscribe(onNext: { isLoading in
            isLoading ? ProgressHUD.show("Loading") : ProgressHUD.dismiss()
        }).disposed(by: disposeBag)
    }
    
    
    private func subscribeToNewsSubjects() {
           self.searchViewModel.newsSubjects
               .bind(to: self.tableView
               .rx
               .items(cellIdentifier: SearchNewsCell.reuseID,cellType: SearchNewsCell.self)) { row, article, cell in

                   cell.configureCell(publishedTime: article.publishedAt, title: article.title, imageUrl: article.urlToImage ?? "")
               }.disposed(by: disposeBag)
       }
    
    
    private func subscripeToSearchNewsSelection(){
        self.tableView.rx.modelSelected(Article.self).bind{ [weak self] article in
            guard let self = self else { return }
            self.navigationToDetails(title: article.title, imageUrl: article.urlToImage ?? "" , description: article.articleDescription ?? "", date: article.publishedAt)
        }.disposed(by: disposeBag)
    }
    
    
    
    private func navigationToDetails(title:String , imageUrl : String? , description:String? , date:String){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        vc.newsTitle       = title
        vc.newsImageUrl    = imageUrl ?? ""
        vc.newsDescription = description ?? ""
        vc.newsDate        = date
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func configureTableView(){
        tableView.rowHeight  = 150
        tableView.register(UINib(nibName: SearchNewsCell.reuseID, bundle: nil), forCellReuseIdentifier: SearchNewsCell.reuseID)
    }
    
}

