//
//  SearchViewController.swift
//  NewsApp
//
//  Created by mahmoud yousef on 04/08/2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureTableView()
    }
    
    
   private func configureSearchController(){
         let searchController                                  = UISearchController()
       //  searchController.searchResultsUpdater                 = self
         searchController.searchBar.placeholder                = "Search for news by title"
         searchController.obscuresBackgroundDuringPresentation = false
         navigationItem.searchController                       = searchController
     }
    
    
    private func configureTableView(){
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.rowHeight  = 150
        tableView.register(UINib(nibName: SearchNewsCell.reuseID, bundle: nil), forCellReuseIdentifier: SearchNewsCell.reuseID)
    }
   
  
  

}

extension SearchViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchNewsCell.reuseID , for: indexPath) as? SearchNewsCell else {fatalError("Unable deque cell...")}
        
        return cell
    }
    
    
}
