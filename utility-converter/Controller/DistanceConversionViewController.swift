//
//  SpeedViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class DistanceConversionViewController: UIViewController {
    
    @IBOutlet weak var meterTextField: UITextField!
    @IBOutlet weak var centimeterTextField: UITextField!
    @IBOutlet weak var millimeterTextField: UITextField!
    @IBOutlet weak var mileTextField: UITextField!
    @IBOutlet weak var yardTextField: UITextField!
    @IBOutlet weak var inchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set Text Field Styles
        meterTextField.borderStyle = UITextField.BorderStyle.roundedRect
        meterTextField._lightPlaceholderColor(UIColor.lightText)
        
        centimeterTextField.borderStyle = UITextField.BorderStyle.roundedRect
        centimeterTextField._lightPlaceholderColor(UIColor.lightText)
        
        millimeterTextField.borderStyle = UITextField.BorderStyle.roundedRect
        millimeterTextField._lightPlaceholderColor(UIColor.lightText)
        
        mileTextField.borderStyle = UITextField.BorderStyle.roundedRect
        mileTextField._lightPlaceholderColor(UIColor.lightText)
        
        yardTextField.borderStyle = UITextField.BorderStyle.roundedRect
        yardTextField._lightPlaceholderColor(UIColor.lightText)
        
        inchTextField.borderStyle = UITextField.BorderStyle.roundedRect
        inchTextField._lightPlaceholderColor(UIColor.lightText)
    }
    
    @IBAction func handleMeterTextFieldChange(_ textField: UITextField) {
        if let input = meterTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = DistanceUnit.meter
                let meterValue = Distance(unit: unit, value: value)
                
                for _unit in DistanceUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapDistanceUnitToTextField(unit: _unit)
                    let result = meterValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleCentimeterTextFieldChange(_ textField: UITextField) {
        if let input = centimeterTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = DistanceUnit.centimeter
                let centimeterValue = Distance(unit: unit, value: value)
                
                for _unit in DistanceUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapDistanceUnitToTextField(unit: _unit)
                    let result = centimeterValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleMillimeterTextFieldChange(_ textField: UITextField) {
        if let input = millimeterTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = DistanceUnit.millimeter
                let millimeterValue = Distance(unit: unit, value: value)
                
                for _unit in DistanceUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapDistanceUnitToTextField(unit: _unit)
                    let result = millimeterValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleMileTextFieldChange(_ textField: UITextField) {
        if let input = mileTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = DistanceUnit.mile
                let mileValue = Distance(unit: unit, value: value)
                
                for _unit in DistanceUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapDistanceUnitToTextField(unit: _unit)
                    let result = mileValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleYardTextFieldChange(_ textField: UITextField) {
        if let input = yardTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = DistanceUnit.yard
                let yardValue = Distance(unit: unit, value: value)
                
                for _unit in DistanceUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapDistanceUnitToTextField(unit: _unit)
                    let result = yardValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleInchTextFieldChange(_ textField: UITextField) {
        if let input = inchTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = DistanceUnit.yard
                let inchValue = Distance(unit: unit, value: value)
                
                for _unit in DistanceUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapDistanceUnitToTextField(unit: _unit)
                    let result = inchValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    func mapDistanceUnitToTextField(unit: DistanceUnit) -> UITextField {
        var textField = meterTextField
        switch unit {
        case .meter:
            textField = meterTextField
        case .centimeter:
            textField = centimeterTextField
        case .millimeter:
            textField = millimeterTextField
        case .mile:
            textField = mileTextField
        case .yard:
            textField = yardTextField
        case .inch:
            textField = inchTextField
        }
        return textField!
    }
    
    func clearTextFields() {
        meterTextField.text = ""
        centimeterTextField.text = ""
        millimeterTextField.text = ""
        mileTextField.text = ""
        yardTextField.text = ""
        inchTextField.text = ""
    }
}
