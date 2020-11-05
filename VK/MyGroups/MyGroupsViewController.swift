//
//  MyGroupsViewController.swift
//  VK
//
//  Created by Арина Кривенко on 22.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class MyGroupsViewController: UIViewController {
    
// ДОБАВЛЕНИЕ ГРУПП ПОЛЬЗОВАТЕЛЯ
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            let newGroupsViewController = segue.source as! NewGroupsViewController
            if let indexPath = newGroupsViewController.tableView.indexPathForSelectedRow {
                let group = newGroupsViewController.groups[indexPath.row]
                if !myGroups.contains(group) {

                myGroups.append(group)
                tableView.reloadData()
                }
            }
        }
    }
    
// УДАЛЕНИЕ ГРУПП ПОЛЬЗОВАТЕЛЯ
    @IBOutlet weak var tableView: UITableView!
    var myGroups = Group.getMyGroups()
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            myGroups.remove(at: indexPath.row)
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
        return myGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell") as? MyGroupsCell else {fatalError()}
  
        cell.titleLabel.text = myGroups[indexPath.row].groupName
        cell.groupAvatarImage.image = UIImage(named: myGroups[indexPath.row].groupImage)
        
        return cell
    }
    func groupChosen(groupName: Group) {
        myGroups.append(groupName)
        tableView.reloadData()
    }
}

