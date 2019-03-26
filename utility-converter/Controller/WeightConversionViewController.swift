//
//  TemperatureViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class WeightConversionViewController: UIViewController, CustomNumericKeyboardDelegate {

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
        
        // Set Text Field Styles and Properties
        kilogramTextField.borderStyle = UITextField.BorderStyle.roundedRect
        kilogramTextField._lightPlaceholderColor(UIColor.lightText)
        kilogramTextField.setAsNumericKeyboard(delegate: self)
        
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
        let textField = kilogramTextField
        let unit = WeightUnit.kilogram
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleGramTextFieldChange(_ textField: UITextField) {
        let textField = gramTextField
        let unit = WeightUnit.gram
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleOunceTextFieldChange(_ textField: UITextField) {
        let textField = ounceTextField
        let unit = WeightUnit.ounce
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleStoneTextFieldChange(_ sender: UITextField) {
        let textField = stoneTextField
        let unit = WeightUnit.stone
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handlePoundTextFieldChange(_ sender: UITextField) {
        let textField = poundTextField
        let unit = WeightUnit.pound
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleSaveButtonClick(_ sender: UIBarButtonItem) {
        print("Save Weight")
    }
    
    func updateTextFields(textField: UITextField, unit: WeightUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let weight = Weight(unit: unit, value: value)
                
                for _unit in WeightUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapUnitToTextField(unit: _unit)
                    let result = weight.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    func mapUnitToTextField(unit: WeightUnit) -> UITextField {
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
    
    func retractKeyPressed() {
        print("Keyboard retract key pressed!")
    }
    
    func numericKeyPressed(key: Int) {
        print("Numeric key \(key) pressed!")
    }
    
    func numericBackspacePressed() {
        print("Backspace pressed!")
    }
    
    func numericSymbolPressed(symbol: String) {
        print("Symbol \(symbol) pressed!")
    }
}
