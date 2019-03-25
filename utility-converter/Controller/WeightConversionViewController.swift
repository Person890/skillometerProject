//
//  TemperatureViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class WeightConversionViewController: UIViewController {
    
    @IBOutlet weak var kilogramTextField: UITextField!
    @IBOutlet weak var gramTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func handleKilogramTextFieldChange(_ sender: Any) {
        let fromUnit = Weight.fromString("kilograms")!
        let toUnit = Weight.fromString("grams")!
        
        if let inputText = kilogramTextField.text {
            if !inputText.isEmpty {
                let inputNum = Double(inputText)!
                let outputNum = fromUnit.convert(unit: toUnit, output: inputNum)
                gramTextField.text = String(outputNum)
            }
        }
    }
    @IBAction func handleGramTextFieldChange(_ sender: Any) {
    }
}
