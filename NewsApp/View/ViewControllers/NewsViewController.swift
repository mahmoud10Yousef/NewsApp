//
//  ViewController.swift
//  NewsApp
//
//  Created by mahmoud yousef on 03/08/2022.
//

import UIKit
import ProgressHUD
import RxSwift


class NewsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var latestNewsTableView: UITableView!
    
    private let newsViewModel = NewsViewModel()
    let disposeBag = DisposeBag()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewCompositionalLayout()
        registerCells()
        subscripeToLoadingView()
        subscribeToTopBannerNews()
        getTopBannerNews()
        getLatestNews()
        subscribeToLatestNews()
        subscripeToTopBannerNewsSelection()
        subscripeToLatestNewsSelection()
        latestNewsTableView.rowHeight = 130
        
    }
    
    
    private func subscribeToTopBannerNews() {
           self.newsViewModel.topNewsSubjects
               .bind(to: self.collectionView
               .rx
               .items(cellIdentifier: NewsBannerCell.reuseID,cellType: NewsBannerCell.self)) { row, article, cell in
               
                   cell.configureCell(publishedTime: article.publishedAt, title: article.title, imageUrl: article.urlToImage ?? "")
           }
           .disposed(by: disposeBag)
       }
    
    
   private func subscribeToLatestNews() {
           self.newsViewModel.latestNewsSubjects
               .bind(to: self.latestNewsTableView
               .rx
               .items(cellIdentifier: LatestNewCell.reuseID, cellType: LatestNewCell.self)) { row, article, cell in
                   print(article.name)
                   cell.configureCell(name: article.name, description: article.description)
               }
           .disposed(by: disposeBag)
        }
    
    
    private func getTopBannerNews(){
        newsViewModel.getTopBannerNews()
    }
    
    
    private func getLatestNews(){
        newsViewModel.getLatestnews()
    }
    
    
    private func subscripeToLoadingView(){
        newsViewModel.loadingBehavior.subscribe(onNext: { isLoading in
            isLoading ? ProgressHUD.show("Loading") : ProgressHUD.dismiss()
        }).disposed(by: disposeBag)
    }
    
    private func subscripeToTopBannerNewsSelection(){
        self.collectionView.rx.modelSelected(Article.self).bind{ [weak self] article in
            guard let self = self else { return }
            self.navigationToDetails(title: article.title, imageUrl: article.urlToImage ?? "" , description: article.articleDescription ?? "", date: article.publishedAt)
        }.disposed(by: disposeBag)
    }
    
    
    private func subscripeToLatestNewsSelection(){
        self.latestNewsTableView.rx.modelSelected(Source.self).bind{ [weak self] news in
            guard let self = self else { return }
            self.navigationToDetails(title: news.name, imageUrl: news.url ?? "" , description: news.description ?? "", date: "2 hours ago")
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
    
    
    
    private func configureCollectionViewCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
                return UIHelper.newsBannerSection()
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    private func registerCells(){
        collectionView.register(UINib(nibName: NewsBannerCell.reuseID, bundle: nil), forCellWithReuseIdentifier: NewsBannerCell.reuseID)
        latestNewsTableView.register(UINib(nibName: LatestNewCell.reuseID, bundle: nil), forCellReuseIdentifier: LatestNewCell.reuseID)
        
    }
    
}







