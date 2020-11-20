//
//  LikeControl.swift
//  VK
//
//  Created by Арина Кривенко on 31.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    let likeImage = UIImageView()
    let likesCount = UILabel()
    let stack = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stack.addArrangedSubview(likeImage)
        stack.addArrangedSubview(likesCount)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.isUserInteractionEnabled = false
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        likesCount.textColor = .black
        likesCount.text = "0"
        likeImage.image = UIImage(systemName: "heart")
        likeImage.tintColor = .black
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if  likesCount.text == "0" {
            likesCount.text = "1"
            likeImage.image = UIImage(systemName: "heart.fill")
            likesCount.textColor = .red
            likeImage.tintColor = .red
            UIView.animate(withDuration: 1.0, delay: 0, animations: {
                self.stack.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    })
            UIView.animate(withDuration: 0.1, delay: 0, animations: {
                        self.stack.transform = CGAffineTransform(scaleX: 1, y: 1)
                    })
        } else {
            likesCount.text = "0"
            likeImage.image = UIImage(systemName: "heart")
            likesCount.textColor = .black
            likeImage.tintColor = .black
            UIView.animate(withDuration: 1.0, delay: 0, animations: {
                self.stack.transform = CGAffineTransform(scaleX: 2, y: 2)
                    })
            UIView.animate(withDuration: 0.1, delay: 0, animations: {
                        self.stack.transform = CGAffineTransform(scaleX: 1, y: 1)
                    })
        }
        
        
    }
}
