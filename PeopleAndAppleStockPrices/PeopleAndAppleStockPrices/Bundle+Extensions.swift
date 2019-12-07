//
//  Bundle+Extensions.swift
//  PeopleAndAppleStockPrices
//
//  Created by Matthew Ramos on 12/7/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension Bundle {
    static func readJSONData(filename: String, ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("Error: Couldn't read data")
        }
        var data: Data!
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("Error: \(error)")
        }
        return data
    }
}
