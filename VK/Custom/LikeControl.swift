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
    private func setUp() {
    let tap = UIGestureRecognizer(target: self, action: #selector(viewTapped))
            addGestureRecognizer(tap)
    }

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
        viewTapped(sender: tap)
        if  likesCount.text == "0" {
            likesCount.text = "1"
            likeImage.image = UIImage(systemName: "heart.fill")
            likesCount.textColor = .red
            likeImage.tintColor = .red
        } else {
            likesCount.text = "0"
            likeImage.image = UIImage(systemName: "heart")
            likesCount.textColor = .black
            likeImage.tintColor = .black
        }
    }
    
    @objc private func viewTapped(sender: UIGestureRecognizer) {
        transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       options: [],
                       animations: {
            self.transform = .identity
        },
        completion: nil
        )
    }
}
