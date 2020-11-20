//
//  NewsItem.swift
//  VK
//
//  Created by Арина Кривенко on 13.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import Foundation

struct NewsItem {
    var author: User
    var postData: String
    var text: String
    var photos: [String]
    
    static let fake: [NewsItem] = (1...10).map { _ in
        NewsItem(author: User.randomOne,
                 postData: "11.11.20",
                 text: "Hello World!",
                 photos: Self.generatePhotos(count: 1))
    }
    
    static func generatePhotos(count: Int) -> [String] {
        guard count > 0 else { return [] }
        return (1...count).compactMap {
            _ in String(Int.random(in: 1...1))
        }
    }
}
//Int.random(in: 0...10)
