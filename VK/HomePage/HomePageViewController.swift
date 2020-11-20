//
//  HomePageViewController.swift
//  VK
//
//  Created by Арина Кривенко on 05.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

final class HomePageViewController: UITableViewController {
    
    let news = NewsItem.fake
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        cell.configure(item: news[indexPath.row])
        return cell
    }
    
}

