//
//  Bulb.swift
//  ChristmasLightsCostCalculator
//
//  Created by Aaron Martinez on 11/14/16.
//  Copyright © 2016 Aaron Martinez. All rights reserved.
//

import Foundation

class Bulb {
    
    let name: String
    let wattage: Int
    let lifeExpectancy: Int
    
    init(name: String, wattage: Int, lifeExpectancy: Int) {
        
        self.name = name
        self.wattage = wattage
        self.lifeExpectancy = lifeExpectancy
    }
}
