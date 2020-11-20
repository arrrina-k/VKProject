//
//  Session.swift
//  VK
//
//  Created by Арина Кривенко on 20.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import Foundation

class Session: CustomStringConvertible {
    
    static let shared = Session()
    private init() {}
    
    var token: String = ""
    var userId: Int = 0
    
    var description: String {
        return "userId: \(userId), token: \(token)"
    }
            
}
