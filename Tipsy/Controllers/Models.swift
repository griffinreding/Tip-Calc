//
//  Models.swift
//  Tipsy
//
//  Created by Griffin Reding on 7/26/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct TipCalcBrain {
    
    var perc: Int?
    var numPeeps: Int?
    var finalPer: String?
    
    func giveIt() -> String? {
        return finalPer
    }
    
    func giveThePeeps() -> Int {
        return numPeeps!
    }
    
    func giveThePerc() -> Int {
        return perc!
    }
    
    mutating func finalCalculation(
        billNoTip: Float,
        numPeople: Int,
        currTip: String) {
            
        var tipAmount: Float?
        var perPerson: Float?
        numPeeps = numPeople
        
        switch currTip {
            case "zero":
                tipAmount = 0.0
                perc = 0
            case "ten":
                tipAmount = billNoTip * 0.1
                perc = 10
            case "twenty":
                tipAmount = billNoTip * 0.2
                perc = 20
            default:
                tipAmount = billNoTip * 0.1
                perc = 10
        }
        perPerson = (billNoTip + tipAmount!) / Float(numPeople)
        finalPer = String(format: "%.2f", perPerson!)
    }
}


