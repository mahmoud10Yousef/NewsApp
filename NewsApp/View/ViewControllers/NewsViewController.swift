//
//  ViewController.swift
//  NewsApp
//
//  Created by mahmoud yousef on 03/08/2022.
//

import UIKit
import ProgressHUD
import RxSwift
import RxDataSources


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
        latestNewsTableView.rowHeight = 120
        
    }
    
    func subscribeToTopBannerNews() {
           self.newsViewModel.topNewsSubjects
               .bind(to: self.collectionView
                   .rx
                        .items(cellIdentifier: NewsBannerCell.reuseID,
                          cellType: NewsBannerCell.self)) { row, article, cell in
                   cell.newsTilteLabel.text = article.title
           }
           .disposed(by: disposeBag)
       }
    
    
    func subscribeToLatestNews() {
           self.newsViewModel.latestNewsSubjects
               .bind(to: self.latestNewsTableView
                   .rx
                        .items(cellIdentifier: LatestNewCell.reuseID,
                          cellType: LatestNewCell.self)) { row, article, cell in
                   cell.newsTitleLabel.text = article.description
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







