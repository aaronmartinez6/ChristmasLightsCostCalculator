//
//  Estimate.swift
//  ChristmasLightsCostCalculator
//
//  Created by Aaron Martinez on 11/14/16.
//  Copyright © 2016 Aaron Martinez. All rights reserved.
//

import Foundation

class Estimate {
    
    let bulbType: String
    let bulbCount: Int
    let hoursPerDay: Int
    let pricePerkWh: Double
    let daysPerYear: Int
    let totalCost: Double
    
    init(bulbType: String, bulbCount: Int, hoursPerDay: Int, pricePerkWh: Double, daysPerYear: Int, totalCost: Double) {
        
        self.bulbType = bulbType
        self.bulbCount = bulbCount
        self.hoursPerDay = hoursPerDay
        self.pricePerkWh = pricePerkWh
        self.daysPerYear = daysPerYear
        self.totalCost = totalCost
    }
}

