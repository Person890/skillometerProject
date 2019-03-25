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
        if let input = celsiusTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else if Double(input) != nil {
                let value = Double(input)!
                let unit = TemperatureUnit.celsius
                let celsiusValue = Temperature(unit: unit, value: value)
                
                for _unit in TemperatureUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapTemperatureUnitToTextField(unit: _unit)
                    let result = celsiusValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleFahrenheitTextFieldChange(_ sender: UITextField) {
        if let input = fahrenheitTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else if Double(input) != nil {
                let value = Double(input)!
                let unit = TemperatureUnit.fahrenheit
                let fahrenheitValue = Temperature(unit: unit, value: value)
                
                for _unit in TemperatureUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapTemperatureUnitToTextField(unit: _unit)
                    let result = fahrenheitValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleKelvinTextFieldChange(_ sender: UITextField) {
        if let input = kelvinTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else if Double(input) != nil {
                let value = Double(input)!
                let unit = TemperatureUnit.kelvin
                let kelvinValue = Temperature(unit: unit, value: value)
                
                for _unit in TemperatureUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapTemperatureUnitToTextField(unit: _unit)
                    let result = kelvinValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    func mapTemperatureUnitToTextField(unit: TemperatureUnit) -> UITextField {
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
