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
    var userInfo = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    let data = Bundle.readJSONData(filename: "userinfo", ext: "json")
    
    override func viewDidLoad() {
    super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        userInfo = UserInfo.getUsers(data: data).sorted { $0.name.first < $1.name.first}
        
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userInfoDetailVC = segue.destination as? UserInfoDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error with preparing segue")
        }
        userInfoDetailVC.user = userInfo[indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            userInfo.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
            let user = userInfo[indexPath.row]
        cell.textLabel?.text = user.name.first.capitalized + " " + user.name.last.capitalized
        cell.detailTextLabel?.text = user.location.city.capitalized + ", " + user.location.state.capitalized
            return cell
        }
        
    }

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        userInfo = UserInfo.getUsers(data: data).sorted { $0.name.first < $1.name.first}
        userInfo = userInfo.filter {
            ($0.name.first.lowercased() + $0.name.last.lowercased()).contains(searchText.lowercased())
        }
    }
}
