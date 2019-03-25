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
    @IBOutlet weak var ounceTextField: UITextField!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var stoneTextField: UITextField!
    @IBOutlet weak var stonePoundTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set Text Field Styles
        kilogramTextField.borderStyle = UITextField.BorderStyle.roundedRect
        kilogramTextField._lightPlaceholderColor(UIColor.lightText)
        
        gramTextField.borderStyle = UITextField.BorderStyle.roundedRect
        gramTextField._lightPlaceholderColor(UIColor.lightText)
        
        ounceTextField.borderStyle = UITextField.BorderStyle.roundedRect
        ounceTextField._lightPlaceholderColor(UIColor.lightText)
        
        poundTextField.borderStyle = UITextField.BorderStyle.roundedRect
        poundTextField._lightPlaceholderColor(UIColor.lightText)
        
        stoneTextField.borderStyle = UITextField.BorderStyle.roundedRect
        stoneTextField._lightPlaceholderColor(UIColor.lightText)
        
        stonePoundTextField.borderStyle = UITextField.BorderStyle.roundedRect
        stonePoundTextField._lightPlaceholderColor(UIColor.lightText)
    }
    
    @IBAction func handleKilogramTextFieldChange(_ textField: UITextField) {
        if let input = kilogramTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = WeightUnit.kilogram
                let kilogramValue = Weight(unit: unit, value: value)
                
                for _unit in WeightUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapWeightUnitToTextField(unit: _unit)
                    let result = kilogramValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleGramTextFieldChange(_ textField: UITextField) {
        if let input = gramTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = WeightUnit.gram
                let gramValue = Weight(unit: unit, value: value)
                
                for _unit in WeightUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapWeightUnitToTextField(unit: _unit)
                    let result = gramValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleOunceTextFieldChange(_ textField: UITextField) {
        if let input = ounceTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = WeightUnit.ounce
                let ounceValue = Weight(unit: unit, value: value)
                
                for _unit in WeightUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapWeightUnitToTextField(unit: _unit)
                    let result = ounceValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleStoneTextFieldChange(_ sender: UITextField) {
        if let input = stoneTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = WeightUnit.stone
                let stoneValue = Weight(unit: unit, value: value)
                
                for _unit in WeightUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapWeightUnitToTextField(unit: _unit)
                    let result = stoneValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handlePoundTextFieldChange(_ sender: UITextField) {
        if let input = poundTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = WeightUnit.pound
                let poundValue = Weight(unit: unit, value: value)
                
                for _unit in WeightUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapWeightUnitToTextField(unit: _unit)
                    let result = poundValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
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
