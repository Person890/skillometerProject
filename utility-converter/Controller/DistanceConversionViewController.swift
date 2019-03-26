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
        let textField = meterTextField
        let unit = DistanceUnit.meter
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleCentimeterTextFieldChange(_ textField: UITextField) {
        let textField = centimeterTextField
        let unit = DistanceUnit.centimeter
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleMillimeterTextFieldChange(_ textField: UITextField) {
        let textField = millimeterTextField
        let unit = DistanceUnit.millimeter
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleMileTextFieldChange(_ textField: UITextField) {
        let textField = mileTextField
        let unit = DistanceUnit.mile
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleYardTextFieldChange(_ textField: UITextField) {
        let textField = yardTextField
        let unit = DistanceUnit.yard
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleInchTextFieldChange(_ textField: UITextField) {
        let textField = inchTextField
        let unit = DistanceUnit.inch
        updateTextFields(textField: textField!, unit: unit)
    }
    
    func updateTextFields(textField: UITextField, unit: DistanceUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let distance = Distance(unit: unit, value: value)
                
                for _unit in DistanceUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapUnitToTextField(unit: _unit)
                    let result = distance.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    func mapUnitToTextField(unit: DistanceUnit) -> UITextField {
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
