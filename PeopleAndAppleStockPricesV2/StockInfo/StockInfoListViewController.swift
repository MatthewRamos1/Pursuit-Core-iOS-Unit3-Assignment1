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
    
    var stockInfo = [Stock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        
        
    }
}

extension StockInfoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
