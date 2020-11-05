//
//  FriendsViewController.swift
//  VK
//
//  Created by Арина Кривенко on 22.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, LetterPickerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var letterPicker: LetterPicker!
    var users = User.getUsers().sorted { $0.userName < $1.userName}
        
        override func viewDidLoad() {
                super.viewDidLoad()
                tableView.dataSource = self
            letterPicker.delegate = self
        }
    func letterPicked(_ letter: String) {
        guard let index = users.firstIndex(where: { $0.userName.lowercased().prefix(1) == letter.lowercased() }) else { return }
        
        let indexPath = IndexPath(row: index, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
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
