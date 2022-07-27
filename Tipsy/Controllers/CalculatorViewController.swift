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
    
    var currTip: Double = 0.1
    var numPeople = 2
    var tipCalcBrain = TipCalcBrain()

    @IBAction func tapAnywhere(_ sender: UITapGestureRecognizer) {
        billTextField.endEditing(true)
        print("tap recorded")
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender {
            case zeroPctButton:
                zeroPctButton.isSelected = true
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                currTip = 0
            case tenPctButton:
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = true
                twentyPctButton.isSelected = false
                currTip = 0.1
            case twentyPctButton:
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = true
                currTip = 0.2
            default:
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = true
                currTip = 0.1
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numPeople = Int(sender.value)
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let billNoTip = Float(billTextField.text!)

        tipCalcBrain.finalCalculation(
            billNoTip: billNoTip!,
            numPeople: numPeople,
            currTip: currTip
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
