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
    @IBAction func buttonTapped(_ sender: Any) {
        
        let login = loginField.text
        let password = passwordField.text
        
        if login == "admin", password == "12345" {
            print("Вход выполнен")
        } else {
            print("Пароль или логин неверны")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

