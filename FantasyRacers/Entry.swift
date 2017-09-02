//
//  FantasyEntry.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 04/04/2017.
//  Copyright © 2017 Christoher Fonseka. All rights reserved.
//

import Foundation

struct Entry
{
    let drivers: [Driver]
    let teams:   [Team]

    var price: Int
    {
        return drivers.reduce(0, { $0 + $1.price })
               + teams.reduce(0, { $0 + $1.price })
    }
}

extension Entry: CustomStringConvertible
{
    var description: String
    {
        return "\(drivers), \(teams) -> £\(price)m"
    }
}

