//
//  StockInfoListViewController.swift
//  PeopleAndAppleStockPricesV2
//
//  Created by Matthew Ramos on 12/9/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class StockInfoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stockInfo = [[Stock]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = Bundle.readJSONData(filename: "appleStockInfo", ext: "json")
        let stocks = Stock.getStocks(data: data)
        stockInfo = Stock.getSections(stocks)
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stockInfoDetailVC = segue.destination as? StockInfoDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error with preparing segue")
        }
        stockInfoDetailVC.stock = stockInfo[indexPath.section][indexPath.row]
    }
}

extension StockInfoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stockInfo[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        let stock = stockInfo[indexPath.section][indexPath.row]
        cell.textLabel?.text = stock.date
        cell.detailTextLabel?.text = String(stock.open)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        stockInfo.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let month = stockInfo[section].first?.month, let year = stockInfo[section].first?.year else {
            return "Error"
        }
        return "\(month) - \(year)"
    }
}
