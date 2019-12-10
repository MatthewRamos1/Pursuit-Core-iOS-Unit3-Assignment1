//
//  StockInfoDetailViewController.swift
//  PeopleAndAppleStockPricesV2
//
//  Created by Matthew Ramos on 12/10/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class StockInfoDetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var openStockPriceLabel: UILabel!
    @IBOutlet weak var closeStockPriceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var backgroundView: UIView!
    
    var stock: Stock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let detailVCStock = stock else {
            fatalError("Couldn't pull Stock, check prepare for segue")
        }
        dateLabel.text = detailVCStock.date
        openStockPriceLabel.text = String(detailVCStock.open)
        closeStockPriceLabel.text = String(detailVCStock.close)
        if detailVCStock.open > detailVCStock.close {
            imageView.image = #imageLiteral(resourceName: "thumbsDown")
            backgroundView.backgroundColor = .red
        } else {
            imageView.image = #imageLiteral(resourceName: "thumbsUp")
            backgroundView.backgroundColor = .green
        }
    }
}
