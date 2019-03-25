//
//  TemperatureViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class WeightConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var kilogramTextField: UITextField!
    @IBOutlet weak var gramTextField: UITextField!
    @IBOutlet weak var ounceTextField: UITextField!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var stoneTextField: UITextField!
    @IBOutlet weak var stonePoundTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func handleKilogramTextFieldChange(_ sender: Any) {
        if let input = kilogramTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = WeightUnit.kilogram
                let kgValue = Weight(unit: unit, value: value)
                
                for _unit in WeightUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapWeightUnitToTextField(unit: _unit)
                    let result = kgValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleGramTextFieldChange(_ sender: Any) {
    }
    
    func mapWeightUnitToTextField(unit: WeightUnit) -> UITextField {
        var textField = kilogramTextField
        switch unit {
        case .kilogram:
            textField = kilogramTextField
        case .gram:
            textField = gramTextField
        case .ounce:
            textField = ounceTextField
        case .pound:
            textField = poundTextField
        case .stone:
            textField = stoneTextField
        }
        return textField!
    }
    
    func clearTextFields() {
        kilogramTextField.text = ""
        gramTextField.text = ""
        ounceTextField.text = ""
        poundTextField.text = ""
        stoneTextField.text = ""
        stonePoundTextField.text = ""
    }
}
