//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var currTip: String?
    var numPeople: Int?
    var finalPer: String?
    var tipCalcBrain = TipCalcBrain()

    @IBAction func tapAnywhere(_ sender: UITapGestureRecognizer) {
        print("tap recorded")
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender {
            case zeroPctButton:
                zeroPctButton.isSelected = true
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                currTip = "zero"
            case tenPctButton:
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = true
                twentyPctButton.isSelected = false
                currTip = "ten"
            case twentyPctButton:
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = true
                currTip = "twenty"
            default:
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = true
                currTip = "ten"
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numPeople = Int(sender.value)
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let billNoTip = Float(billTextField.text!)

        if numPeople == nil {
            numPeople = 2
        }
        tipCalcBrain.finalCalculation(
            billNoTip: billNoTip!,
            numPeople: numPeople!,
            currTip: currTip!
        )
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ("goToResults") {
            let destinationVC = segue.destination as!
                ResultsViewController
            
            destinationVC.totalPer = tipCalcBrain.giveIt()
            destinationVC.peeps = tipCalcBrain.giveThePeeps()
            destinationVC.perc  = tipCalcBrain.giveThePerc()
        }
    }
}
