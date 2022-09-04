//
//  ViewController.swift
//  NewsApp
//
//  Created by mahmoud yousef on 03/08/2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewCompositionalLayout()
        configureCollectionView()
        NetworkManager.shared.fetchData(url: "https://newsapi.org/v2/top-headlines?country=eg&apiKey=db71d97193dd453db7fec98cd40a1290", decodable: News.self) { result in
            switch result{
                
            case .success(let data):
                print(data)
            case .failure(let error):
                print("failure")
                print(error.rawValue)
            }
        }
        
    }
    
    
    private func configureCollectionViewCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return UIHelper.newsBannerSection()
                
            default:
                return UIHelper.latestNewsSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    private func configureCollectionView(){
        collectionView.delegate   = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: NewsBannerCell.reuseID, bundle: nil), forCellWithReuseIdentifier: NewsBannerCell.reuseID)
        collectionView.register(UINib(nibName: LatestNewsCell.reusueID, bundle: nil), forCellWithReuseIdentifier: LatestNewsCell.reusueID)
        
        
    }
    
}


extension NewsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 10
        default:
            return 20
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsBannerCell.reuseID, for: indexPath) as? NewsBannerCell else {fatalError("Unable deque cell...")}
            
            return cell
            
        case 1 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestNewsCell.reusueID , for: indexPath) as? LatestNewsCell else {fatalError("Unable deque cell...")}
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    
    
}






