//
//  MyFriendsCell.swift
//  VK
//
//  Created by Арина Кривенко on 22.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell {
   
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var friendAvatarImageView: UIImageView!
    @IBOutlet weak var friendAvatarContainerView: UIView!

    override func prepareForReuse() {
           super.prepareForReuse()
       }
    
       override func awakeFromNib() {
           super.awakeFromNib()
        friendAvatarImageView.layer.cornerRadius = friendAvatarImageView.frame.size.width / 2
        friendAvatarImageView.clipsToBounds = true

        friendAvatarContainerView.layer.shadowColor = UIColor.black.cgColor
        friendAvatarContainerView.layer.shadowOpacity = 1
        friendAvatarContainerView.layer.shadowOffset = .zero
        friendAvatarContainerView.layer.shadowRadius = 10
    }
}

