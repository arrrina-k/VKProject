//
//  FriendsViewController.swift
//  VK
//
//  Created by Арина Кривенко on 22.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, LetterPickerDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var letterPicker: LetterPicker!
    @IBOutlet weak var searchView: SearchView!
    
    var sections: [String] = []
    var allUsers: [User] = []
    var filteredUsers: [User] = []
    var cachedSectionItems: [String: [User]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        setupAllItems()
        reloadDataSource()
        setupViews()
    }
    
    func getItems(for section: Int) -> [User] {
        let sectionLetter = sections[section]
        
        if let sectionItems = cachedSectionItems[sectionLetter] {
            return sectionItems
        }
        
        let sectionItems = filteredUsers.filter {
            $0.userName.uppercased().prefix(1) == sectionLetter
        }
        cachedSectionItems[sectionLetter] = sectionItems
        return sectionItems
    }
    
    func getItem(for indexPath: IndexPath) -> User {
        return getItems(for: indexPath.section)[indexPath.row]
    }
    
    func filterItems(text: String?) {
        guard let text = text, !text.isEmpty else {
            filteredUsers = allUsers
            return
        }
        filteredUsers = allUsers.filter {
            $0.userName.lowercased().contains(text.lowercased())
        }
    }
    
    private func setupAllItems() {
        allUsers = User.getUsers().sorted { $0.userName < $1.userName}
    }
    
    private func reloadDataSource(){
        filterItems(text: searchView.text)
        
        let allLetters = filteredUsers.map { String($0.userName.uppercased().prefix(1)) }
        sections = Array(Set(allLetters)).sorted()
        
        cachedSectionItems = [:]
    }
    
    private func setupViews() {
        letterPicker.delegate = self
        letterPicker.letters = sections
    }
    
    func letterPicked(_ letter: String) {
        guard let sectionIndex = sections.firstIndex(where: { $0 == letter }) else { return }
        
        let indexPath = IndexPath(row: 0, section: sectionIndex)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getItems(for: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCell") as? MyFriendsCell else {fatalError()}
        
        let user = getItem(for: indexPath)
        cell.titelLabel.text = user.userName
        cell.avatarView.image = UIImage(named: allUsers[indexPath.row].userImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadDataSource()
        tableView.reloadData()
        letterPicker.letters = sections
    }
}
