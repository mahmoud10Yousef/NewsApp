//
//  BookmarkNewsViewController.swift
//  NewsApp
//
//  Created by mahmoud yousef on 04/08/2022.
//

import UIKit

class BookmarkNewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    

    private func configureTableView(){
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.rowHeight  = 150
        tableView.register(UINib(nibName: BookmarkNewsCell.reuseID, bundle: nil), forCellReuseIdentifier: BookmarkNewsCell.reuseID)
    }
   
  
  

}

extension BookmarkNewsViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookmarkNewsCell.reuseID , for: indexPath) as? BookmarkNewsCell else {fatalError("Unable deque cell...")}
        
        return cell
    }
    
    
}
