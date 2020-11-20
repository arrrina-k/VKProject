//
//  User.swift
//  VK
//
//  Created by Арина Кривенко on 23.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import Foundation

struct User {
    var userName: String
    var userImage: String
    
    static var usersName = ["Крош",
                            "Нюша",
                            "Ежик",
                            "Пин",
                            "Совунья",
                            "Лосяш",
                            "Копатыч",
                            "Кар Карыч",
                            "Бараш",
                            "Степанида",
                            "Железная няня"]
   
    static func getUsers() -> [User]{
        
        var users = [User]()
        
        for user in usersName{
            users.append(User(userName: user, userImage: user))
        }
        
        return users
    }
    static var randomOne: User {
        return User(userName: "Крош", userImage: "1")
    }
}

