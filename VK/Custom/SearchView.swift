//
//  SearchView.swift
//  VK
//
//  Created by Арина Кривенко on 10.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

final class SearchView: UIView, UITextFieldDelegate {

    var text: String? {
        return textField.text
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var textFieldLeading: NSLayoutConstraint!
    @IBOutlet weak var searchIconCenterX: NSLayoutConstraint!
    @IBOutlet weak var cancelButtonTrailing: NSLayoutConstraint!
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let iconWidth = searchIcon.frame.width
        searchIconCenterX.constant = -(bounds.width / 2 - iconWidth)
        textFieldLeading.constant = iconWidth * 2
        cancelButtonTrailing.constant = 10
        
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
        return true
    }
    @IBAction func cancelTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        
        searchIconCenterX.constant = 0
        textFieldLeading.constant = 0
        cancelButtonTrailing.constant = -60
        
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
    }

}
