//
//  GalleryViewController.swift
//  VK
//
//  Created by Арина Кривенко on 15.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

final class GalleryViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var photo: String = " "
        
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage.loadAvatar(photo)
    }
}
