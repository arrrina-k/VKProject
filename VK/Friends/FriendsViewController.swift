//
//  FriendsViewController.swift
//  VK
//
//  Created by Арина Кривенко on 22.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
     var users = User.getUsers()
        
        override func viewDidLoad() {
                super.viewDidLoad()
                
                tableView.dataSource = self
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
