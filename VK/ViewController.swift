//
//  ViewController.swift
//  VK
//
//  Created by Арина Кривенко on 15.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppeared), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc
    private func keyboardAppeared(notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
        print("keyboard shown \(keyboardSize.height)")
        scrollView.contentInset.bottom = keyboardSize.height
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let login = loginField.text!
        let password = passwordField.text!
        
        return true
        if login == "admin" && password == "12345" {
            return true
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            let action = UIAlertAction(title: "Понятно", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        
            return false
        }
    }

}

