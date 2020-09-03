//
//  PhotoFriendViewController.swift
//  VK
//
//  Created by Арина Кривенко on 23.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class PhotoFriendViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var users = User.getUsers()
        override func viewDidLoad() {
            super.viewDidLoad()
            
            collectionView.dataSource = self
        }
}

extension PhotoFriendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoFriendCell", for: indexPath) as? PhotoFriendCell else {fatalError()}
        
        cell.photoFriendImageView.image = UIImage(named: users[indexPath.row].userImage)
        return cell
    }
}
