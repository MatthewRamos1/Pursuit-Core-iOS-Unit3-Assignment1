//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var userInfo = [User]()
    
    override func viewDidLoad() {
    super.viewDidLoad()
        tableView.dataSource = self
        let data = Bundle.readJSONData(filename: "userinfo", ext: "json")
        userInfo = UserInfo.getUsers(data: data)
  }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            userInfo.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
            let user = userInfo[indexPath.row]
        cell.textLabel?.text = user.name.first + " " + user.name.last
        cell.detailTextLabel?.text = user.location.city + ", " + user.location.state
            return cell
        }
        
    }


