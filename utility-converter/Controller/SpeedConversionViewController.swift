//
//  SpeedConversionViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class SpeedConversionViewController: UIViewController {
    
    @IBOutlet weak var msTextField: UITextField!
    @IBOutlet weak var kmhTextField: UITextField!
    @IBOutlet weak var mihTextField: UITextField!
    @IBOutlet weak var knTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set Text Field Styles
        msTextField.borderStyle = UITextField.BorderStyle.roundedRect
        msTextField._lightPlaceholderColor(UIColor.lightText)
        
        kmhTextField.borderStyle = UITextField.BorderStyle.roundedRect
        kmhTextField._lightPlaceholderColor(UIColor.lightText)
        
        mihTextField.borderStyle = UITextField.BorderStyle.roundedRect
        mihTextField._lightPlaceholderColor(UIColor.lightText)
        
        knTextField.borderStyle = UITextField.BorderStyle.roundedRect
        knTextField._lightPlaceholderColor(UIColor.lightText)
    }
    
    @IBAction func handleMsTextFieldChange(_ sender: UITextField) {
        let textField = msTextField
        let unit = SpeedUnit.ms
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleKmhTextFieldChange(_ sender: UITextField) {
        let textField = kmhTextField
        let unit = SpeedUnit.kmh
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleMhTextFieldChange(_ sender: UITextField) {
        let textField = mihTextField
        let unit = SpeedUnit.mih
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleKnTextFieldChange(_ sender: UITextField) {
        let textField = knTextField
        let unit = SpeedUnit.kn
        updateTextFields(textField: textField!, unit: unit)
    }
    
    func updateTextFields(textField: UITextField, unit: SpeedUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let speed = Speed(unit: unit, value: value)
                
                for _unit in SpeedUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapUnitToTextField(unit: _unit)
                    let result = speed.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    func mapUnitToTextField(unit: SpeedUnit) -> UITextField {
        var textField = msTextField
        switch unit {
        case .ms:
            textField = msTextField
        case .kmh:
            textField = kmhTextField
        case .mih:
            textField = mihTextField
        case .kn:
            textField = knTextField
        }
        return textField!
    }
    
    func clearTextFields() {
        msTextField.text = ""
        kmhTextField.text = ""
        mihTextField.text = ""
        knTextField.text = ""
    }
}
