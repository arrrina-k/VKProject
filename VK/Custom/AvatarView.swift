//
//  AvatarView.swift
//  VK
//
//  Created by Арина Кривенко on 05.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

@IBDesignable
class AvatarView: UIView {
    
    @IBInspectable
        var shadowRadius: CGFloat = 0 {
            didSet {
                updateShadow()
            }
        }
    
    @IBInspectable
    var shadowColor: UIColor = .black {
            didSet {
                updateShadow()
            }
        }
    
    @IBInspectable
        var shadowOpacity: Float = 1 {
            didSet {
                updateShadow()
            }
        }
    
    @IBInspectable
        var image: UIImage? {
            didSet {
                imageView.image = image
                setNeedsDisplay()
            }
        }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(shadowView)
        addSubview(imageView)
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        shadowView.layer.cornerRadius = shadowView.frame.width / 2
    }
    
    private func updateShadow() {
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
    }
}

