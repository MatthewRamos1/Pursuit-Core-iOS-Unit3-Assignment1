//
//  UserInfo.swift
//  PeopleAndAppleStockPrices
//
//  Created by Matthew Ramos on 12/8/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct UserInfo: Decodable {
    let results: [RandomUser]
}

struct RandomUser: Decodable {
    let name: Name
    let email: String
    let location: Location
    let phone: String
}

struct Name: Decodable {
    let first: String
    let last: String
}

struct Location: Decodable {
    let city: String
    let state: String
}



extension UserInfo {
    static func getUsers(data: Data) -> [RandomUser] {
        var randomUsers = [RandomUser]()
        do {
            let randomUserData = try JSONDecoder().decode(UserInfo.self, from: data)
            randomUsers = randomUserData.results
        } catch {
            fatalError("Can't parse data \(error)")
        }
        return randomUsers
}
}
