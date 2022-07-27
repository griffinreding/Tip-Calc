//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Griffin Reding on 7/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPer: String?
    var peeps: Int?
    var perc: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "$\(totalPer!)"
        settingsLabel.text = "Split between \(peeps!) people, with \(perc!)% tip."
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}