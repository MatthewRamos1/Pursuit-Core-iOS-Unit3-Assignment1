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
    var month: String {
        let dateComponents = label.components(separatedBy: " ")
        return dateComponents.first ?? "Error"
    }
    var year: String {
        let dateComponents = label.components(separatedBy: " ")
        return dateComponents.last ?? "Error"
    }

    static func getStocks (data: Data) -> [Stock] {
        var stocks = [Stock]()
        do {
            stocks = try JSONDecoder().decode([Stock].self, from: data)
        } catch {
            fatalError("Can't parse data \(error)")
        }
        return stocks
    }
    
    static func stringToDate (_ input: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        guard let newDate = dateFormatter.date(from: input) else {
            fatalError("Error: Couldn't convert dates")
        }
        return newDate
    }

    static func getSections(_ input: [Stock]) -> [[Stock]] {
        let sortedStocks = input.sorted { Stock.stringToDate($0.label) < Stock.stringToDate($1.label)}
        let uniqueMonths = Set(sortedStocks.map { [$0.month:$0.year] })
        var sections = Array(repeating: [Stock](), count: uniqueMonths.count)
        var currentIndex = 0
        var currentMonth = sortedStocks.first?.month ?? "Error"
        for stock in sortedStocks {
            if stock.month == currentMonth {
                sections[currentIndex].append(stock)
            } else {
                currentIndex += 1
                print(currentIndex)
                currentMonth = stock.month
                sections[currentIndex].append(stock)
            }
        }
        return sections
    }
}
