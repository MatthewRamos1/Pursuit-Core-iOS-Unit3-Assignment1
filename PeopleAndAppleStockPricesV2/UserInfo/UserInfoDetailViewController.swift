//
//  UserInfoDetailViewController.swift
//  PeopleAndAppleStockPricesV2
//
//  Created by Matthew Ramos on 12/8/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class UserInfoDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}