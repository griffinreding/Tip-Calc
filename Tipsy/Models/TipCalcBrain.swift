//
//  Models.swift
//  Tipsy
//
//  Created by Griffin Reding on 7/26/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct TipCalcBrain {
    
    var perc = 0
    var numPeeps = 0
    var finalPer = ""
    
    func giveIt() -> String? {
        return finalPer
    }
    
    func giveThePeeps() -> Int {
        return numPeeps
    }
    
    func giveThePerc() -> Int {
        return perc
    }
    
    mutating func finalCalculation(
        billNoTip: Double,
        numPeople: Int,
        currTip: Double) {
            
        var tipAmount: Double = 0.0
        var perPerson: Double = 0.0
        numPeeps = numPeople
        
        switch currTip {
            case 0:
                tipAmount = 0.0
                perc = 0
            case 0.1:
                tipAmount = billNoTip * 0.1
                perc = 10
            case 0.2:
                tipAmount = billNoTip * 0.2
                perc = 20
            default:
                tipAmount = billNoTip * 0.1
                perc = 10
        }
        perPerson = (billNoTip + tipAmount) / Double(numPeople)
        finalPer = String(format: "%.2f", perPerson)
    }
}


