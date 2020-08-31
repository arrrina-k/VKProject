//
//  MyGroupsViewController.swift
//  VK
//
//  Created by Арина Кривенко on 22.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class MyGroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var groups = Group.getGroups()
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
}
    extension MyGroupsViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return groups.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell") as? MyGroupsCell else {fatalError()}
      
            cell.titleLabel.text = groups[indexPath.row].groupName
            cell.groupAvatarImage.image = UIImage(named: groups[indexPath.row].groupImage)
            
            return cell
        }
        func groupChosen(groupName: Group) {
            groups.append(groupName)
            tableView.reloadData()
        }
}

