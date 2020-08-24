//
//  NewGroupsViewController.swift
//  VK
//
//  Created by Арина Кривенко on 23.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class NewGroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
     var newGroups = NewGroup.getNewGroups()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
}
    extension NewGroupsViewController: UITableViewDataSource {
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return newGroups.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              
               guard let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupsCell") as? NewGroupsCell else {fatalError()}
         
              cell.newGroupNameLabel.text = newGroups[indexPath.row].newGroupName
              cell.newGroupAvatarImageView.image = UIImage(named: newGroups[indexPath.row].newGroupImage)
            
               return cell
           }
}
