//
//  StockInfo.swift
//  PeopleAndAppleStockPricesV2
//
//  Created by Matthew Ramos on 12/9/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    let date: String
    let label: String
    let open: Double
    let close: Double


static func getStocks (data: Data) -> [Stock] {
    var stocks = [Stock]()
    do {
       stocks = try JSONDecoder().decode([Stock].self, from: data)
    } catch {
        fatalError("Can't parse data \(error)")
    }
    return stocks
}
}
