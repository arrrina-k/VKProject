//
//  UIImageExtension.swift
//  VK
//
//  Created by Арина Кривенко on 15.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func loadAvatar(_ title: String) -> UIImage? {
        return UIImage(named: "Avatars/\(title)")
    }
}
