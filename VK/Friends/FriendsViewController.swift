//
//  FriendsViewController.swift
//  VK
//
//  Created by Арина Кривенко on 22.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
  
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
//    var users: [String] = []
    var currentDataSource: [User] = []
    var searchController: UISearchController!
    var users = User.getUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
//
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchContainerView.addSubview(searchController.searchBar)
//        searchController.searchBar.delegate = self
    }
    
//    func filterCurrentDataSource(searchTerm: String) {
//        if searchTerm.count > 0 {
//            currentDataSource = users
//
//            let filteredResults = currentDataSource.filter { $0.replacingOccurrences(of: "  ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: "  ", with: "").lowercased())
//            }
//
//            currentDataSource = filteredResults
//            tableView.reloadData()
//        }
//    }
    
    func restoreCurrentDataSource() {
        currentDataSource = users
        tableView.reloadData()
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCell") as? MyFriendsCell else {fatalError()}
  
        cell.titelLabel.text = users[indexPath.row].userName
        cell.friendAvatarImageView.image = UIImage(named: users[indexPath.row].userImage)
        return cell
    }
}

//extension FriendsViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        if let searchText = searchController.searchBar.text {
//            filterCurrentDataSource(searchTerm: searchText)
//        }
//    }
//}
//
//extension FriendsViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchController.isActive = false
//
//        if let searchText = searchBar.text {
//            filterCurrentDataSource(searchTerm: searchText)
//        }
//    }
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchController.isActive = false
//
//        if let searchText = searchBar.text, !searchText.isEmpty {
//            restoreCurrentDataSource()
//        }
//    }
//}
