//
//  EstimateController.swift
//  ChristmasLightsCostCalculator
//
//  Created by Aaron Martinez on 11/14/16.
//  Copyright © 2016 Aaron Martinez. All rights reserved.
//

import Foundation

class EstimateController {
    
    //C
    
//    static var scenario1: Estimate?
//    static var scenario2: Estimate?
    
//    static func createScenario(selectedSegmentIndex: Int, bulbType: String, bulbCount: Int, hoursPerDay: Int, pricePerkWh: Double, daysPerYear: Int, totalCost: Double) {
//        
//        if selectedSegmentIndex == 0 {
//            self.scenario1 =
//        } else {
//            
//        }
//        
//        
//        
//        
//    }
    
    static func calculateEnergyCosts(wattsPerBulb: Double, bulbCount: Int, hoursPerDay: Int, pricePerkWh: Double, daysPerYear: Int) -> String {
     
    
        let totalWatts = wattsPerBulb * Double(bulbCount)
        let costPerDay = totalWatts / 1000.0 * Double(hoursPerDay) * pricePerkWh
        let totalCost = costPerDay * Double(daysPerYear)
        
        
        
        return "$\(String(abs(totalCost.roundTo(places: 2))))"
    }
    
//    static func calculateEnergyCostsReturnDouble(wattsPerBulb: Double, bulbCount: Int, hoursPerDay: Int, pricePerkWh: Double, daysPerYear: Int) -> Double {
//        
//        
//        let totalWatts = wattsPerBulb * Double(bulbCount)
//        let costPerDay = totalWatts / 1000.0 * Double(hoursPerDay) * pricePerkWh
//        return costPerDay * Double(daysPerYear)
//    }
    
    
    //R
    //U
    //D

}

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
