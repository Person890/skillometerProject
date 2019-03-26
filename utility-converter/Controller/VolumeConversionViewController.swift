//
//  VolumeViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//
import UIKit

class VolumeConversionViewController: UIViewController {
    
    @IBOutlet weak var litreTextField: UITextField!
    @IBOutlet weak var millilitreTextField: UITextField!
    @IBOutlet weak var gallonTextField: UITextField!
    @IBOutlet weak var pintTextField: UITextField!
    @IBOutlet weak var fluidOunceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set Text Field Styles
        litreTextField.borderStyle = UITextField.BorderStyle.roundedRect
        litreTextField._lightPlaceholderColor(UIColor.lightText)
        
        millilitreTextField.borderStyle = UITextField.BorderStyle.roundedRect
        millilitreTextField._lightPlaceholderColor(UIColor.lightText)
        
        gallonTextField.borderStyle = UITextField.BorderStyle.roundedRect
        gallonTextField._lightPlaceholderColor(UIColor.lightText)
        
        pintTextField.borderStyle = UITextField.BorderStyle.roundedRect
        pintTextField._lightPlaceholderColor(UIColor.lightText)
        
        fluidOunceTextField.borderStyle = UITextField.BorderStyle.roundedRect
        fluidOunceTextField._lightPlaceholderColor(UIColor.lightText)
     }
    
    @IBAction func handleLitreTextFieldChange(_ textField: UITextField) {
        if let input = litreTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = VolumeUnit.litre
                let litreValue = Volume(unit: unit, value: value)
                
                for _unit in VolumeUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapVolumeUnitToTextField(unit: _unit)
                    let result = litreValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleMillilitreTextFieldChange(_ textField: UITextField) {
        if let input = millilitreTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = VolumeUnit.millilitre
                let millilitreValue = Volume(unit: unit, value: value)
                
                for _unit in VolumeUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapVolumeUnitToTextField(unit: _unit)
                    let result = millilitreValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleGallonTextFieldChange(_ textField: UITextField) {
        if let input = gallonTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = VolumeUnit.gallon
                let gallonValue = Volume(unit: unit, value: value)
                
                for _unit in VolumeUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapVolumeUnitToTextField(unit: _unit)
                    let result = gallonValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handlePintTextFieldChange(_ textField: UITextField) {
        if let input = pintTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = VolumeUnit.pint
                let pintValue = Volume(unit: unit, value: value)
                
                for _unit in VolumeUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapVolumeUnitToTextField(unit: _unit)
                    let result = pintValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    @IBAction func handleFluidOunceTextFieldChange(_ textField: UITextField) {
        if let input = fluidOunceTextField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let unit = VolumeUnit.fluidOunce
                let flOunceValue = Volume(unit: unit, value: value)
                
                for _unit in VolumeUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapVolumeUnitToTextField(unit: _unit)
                    let result = flOunceValue.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    func mapVolumeUnitToTextField(unit: VolumeUnit) -> UITextField {
        var textField = litreTextField
        switch unit {
        case .litre:
            textField = litreTextField
        case .millilitre:
            textField = millilitreTextField
        case .gallon:
            textField = gallonTextField
        case .pint:
            textField = pintTextField
        case .fluidOunce:
            textField = fluidOunceTextField
        }
        return textField!
    }
    
    func clearTextFields() {
        litreTextField.text = ""
        millilitreTextField.text = ""
        gallonTextField.text = ""
        pintTextField.text = ""
        fluidOunceTextField.text = ""
    }
}
