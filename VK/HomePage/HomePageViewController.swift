//
//  HomePageViewController.swift
//  VK
//
//  Created by Арина Кривенко on 05.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           tableView.dataSource = self
       }
}

extension HomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
             guard let cell = tableView.dequeueReusableCell(withIdentifier: "homePageCell") as? HomePageCell else {fatalError()}
          
             return cell
    }
    
    
}

