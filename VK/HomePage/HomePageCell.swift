//
//  HomePageCell.swift
//  VK
//
//  Created by Арина Кривенко on 05.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

final class HomePageCell: UITableViewCell {
    
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var photosContainer: UIView!
    @IBOutlet weak var likeControl: LikeControl!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        authorImageView.layer.cornerRadius = authorImageView.frame.width / 2
    }
    
    func configure(item: NewsItem) {
//        authorImageView.image = UIImage.loadAvatar(item.author.userImage)
        authorLabel.text = item.author.userName
        dateLabel.text = item.postData
        newsTextLabel.text = item.text
        setupPhotos(item.photos)
    }
    
    private func setupPhotos(_ photos: [String]) {
        photosContainer.isHidden = photos.count == 0
        guard !photos.isEmpty else { return }
        
        switch photos.count {
        case 1:
            let imageView = createImageView(photos[0])
            photosContainer.addSubview(imageView)
            pinView(imageView, to: photosContainer)
        default:
            break
        }
    }
    
    private func createImageView(_ photo: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage.loadAvatar(photo))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func pinView(_ view: UIView, to otherView: UIView) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: otherView.topAnchor),
            view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor)
            
        ])
    }
    
    
}
