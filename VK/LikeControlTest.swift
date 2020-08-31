//
//  LikeControl.swift
//  VK
//
//  Created by Арина Кривенко on 30.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    private var count: Int = 0
    
    private let likesCount = UILabel()
    private let imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(likesCount)
        addSubview(imageView)
        
        let imageConstraints = [
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: likesCount.leftAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalTo: heightAnchor) 
        ]
        
        let labelConstraint = [
            likesCount.rightAnchor.constraint(equalTo: rightAnchor),
            likesCount.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(labelConstraint + imageConstraints)
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onHeartTapped(_:)))
        imageView.addGestureRecognizer(gesture)
        updateView()
    }
    
    private func updateView() {
        likesCount.text = "\(count)"
        if isSelected {
            imageView.image = UIImage(systemName: "heart.fill")
        }
        else {
            imageView.image = UIImage(systemName: "heart")
        }
    }
    
    
    @objc func onHeartTapped(_ gesture: UIGestureRecognizer) {
        isSelected = !isSelected
        count += isSelected ? 1 : -1
        updateView()
        sendActions(for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
