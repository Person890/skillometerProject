//
//  TemperatureConversionViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class TemperatureConversionViewController: UIViewController {
    
    @IBOutlet weak var celsiusTextField: UITextField!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var kelvinTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set Text Field Styles
        celsiusTextField.borderStyle = UITextField.BorderStyle.roundedRect
        celsiusTextField._lightPlaceholderColor(UIColor.lightText)
        
        fahrenheitTextField.borderStyle = UITextField.BorderStyle.roundedRect
        fahrenheitTextField._lightPlaceholderColor(UIColor.lightText)
        
        kelvinTextField.borderStyle = UITextField.BorderStyle.roundedRect
        kelvinTextField._lightPlaceholderColor(UIColor.lightText)
    }
    
    @IBAction func handleCelsiusTextFieldChange(_ sender: UITextField) {
        let textField = celsiusTextField
        let unit = TemperatureUnit.celsius
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleFahrenheitTextFieldChange(_ sender: UITextField) {
        let textField = fahrenheitTextField
        let unit = TemperatureUnit.fahrenheit
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleKelvinTextFieldChange(_ sender: UITextField) {
        let textField = kelvinTextField
        let unit = TemperatureUnit.kelvin
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleSaveButtonClick(_ sender: UIBarButtonItem) {
        print("Save Temperature")
    }
    
    func updateTextFields(textField: UITextField, unit: TemperatureUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let temperature = Temperature(unit: unit, value: value)
                
                for _unit in TemperatureUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapUnitToTextField(unit: _unit)
                    let result = temperature.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    func mapUnitToTextField(unit: TemperatureUnit) -> UITextField {
        var textField = celsiusTextField
        switch unit {
        case .celsius:
            textField = celsiusTextField
        case .fahrenheit:
            textField = fahrenheitTextField
        case .kelvin:
            textField = kelvinTextField
        }
        return textField!
    }
    
    func clearTextFields() {
        celsiusTextField.text = ""
        fahrenheitTextField.text = ""
        kelvinTextField.text = ""
    }
}
