//
//  TemperatureViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

let WEIGHTS_USER_DEFAULTS_KEY = "weight"
private let WEIGHTS_USER_DEFAULTS_MAX_COUNT = 5

class WeightConversionViewController: UIViewController, CustomNumericKeyboardDelegate {

    @IBOutlet weak var weightViewScroller: UIScrollView!
    @IBOutlet weak var outerStackView: UIStackView!
    @IBOutlet weak var outerStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var kilogramTextField: UITextField!
    @IBOutlet weak var kilogramTextFieldStackView: UIStackView!
    @IBOutlet weak var gramTextField: UITextField!
    @IBOutlet weak var gramTextFieldStackView: UIStackView!
    @IBOutlet weak var ounceTextField: UITextField!
    @IBOutlet weak var ounceTextFieldStackView: UIStackView!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var poundsTextFieldStackView: UIStackView!
    @IBOutlet weak var spStoneTextField: UITextField!
    @IBOutlet weak var spPoundTextField: UITextField!
    @IBOutlet weak var spTextFieldStackView: UIStackView!
    
    var activeTextField = UITextField()
    var outerStackViewTopConstraintDefaultHeight: CGFloat = 17.0
    var textFieldKeyBoardGap = 20
    var keyBoardHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set Text Field Styles and Properties
        kilogramTextField.borderStyle = UITextField.BorderStyle.roundedRect
        kilogramTextField._lightPlaceholderColor(UIColor.lightText)
        kilogramTextField.setAsNumericKeyboard(delegate: self)
        
        gramTextField.borderStyle = UITextField.BorderStyle.roundedRect
        gramTextField._lightPlaceholderColor(UIColor.lightText)
        gramTextField.setAsNumericKeyboard(delegate: self)
        
        ounceTextField.borderStyle = UITextField.BorderStyle.roundedRect
        ounceTextField._lightPlaceholderColor(UIColor.lightText)
        ounceTextField.setAsNumericKeyboard(delegate: self)
        
        poundTextField.borderStyle = UITextField.BorderStyle.roundedRect
        poundTextField._lightPlaceholderColor(UIColor.lightText)
        poundTextField.setAsNumericKeyboard(delegate: self)
        
        spStoneTextField.borderStyle = UITextField.BorderStyle.roundedRect
        spStoneTextField._lightPlaceholderColor(UIColor.lightText)
        spStoneTextField.setAsNumericKeyboard(delegate: self)
        
        spPoundTextField.borderStyle = UITextField.BorderStyle.roundedRect
        spPoundTextField._lightPlaceholderColor(UIColor.lightText)
        spPoundTextField.setAsNumericKeyboard(delegate: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillHide() {
        view.endEditing(true)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.outerStackViewTopConstraint.constant = self.outerStackViewTopConstraintDefaultHeight
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        activeTextField = self.findFirstResponder(inView: self.view) as! UITextField
        var activeTextFieldSuperView = activeTextField.superview!
        
        if activeTextField.tag == 1 || activeTextField.tag == 2 {
            activeTextFieldSuperView = activeTextField.superview!.superview!
        }
        
        if let info = notification.userInfo {
            let keyboard:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            
            let targetY = view.frame.size.height - keyboard.height - 15 - activeTextField.frame.size.height
            
            let initialY = outerStackView.frame.origin.y + activeTextFieldSuperView.frame.origin.y + activeTextField.frame.origin.y
            
            if initialY > targetY {
                let diff = targetY - initialY
                let targetOffsetForTopConstraint = outerStackViewTopConstraint.constant + diff
                self.view.layoutIfNeeded()
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.outerStackViewTopConstraint.constant = targetOffsetForTopConstraint
                    self.view.layoutIfNeeded()
                })
            }
            
            var contentInset:UIEdgeInsets = self.weightViewScroller.contentInset
            contentInset.bottom = keyboard.size.height
            weightViewScroller.contentInset = contentInset
        }
    }
    
    func findFirstResponder(inView view: UIView) -> UIView? {
        for subView in view.subviews as! [UIView] {
            if subView.isFirstResponder {
                return subView
            }
            
            if let recursiveSubView = self.findFirstResponder(inView: subView) {
                return recursiveSubView
            }
        }
        
        return nil
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
    
    @IBAction func handlePoundTextFieldChange(_ sender: UITextField) {
        let textField = poundTextField
        let unit = WeightUnit.pound
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleStoneTextFieldChange(_ sender: UITextField) {
        let textField = spStoneTextField
        let unit = WeightUnit.stone
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleSaveButtonClick(_ sender: UIBarButtonItem) {
        let conversion = "\(kilogramTextField.text!) kg = \(gramTextField.text!) g = \(ounceTextField.text!) oz =  \(poundTextField.text!) lb = \(spStoneTextField.text!) stones & \(spPoundTextField.text!) pounds"
        
        var weightsArr = UserDefaults.standard.array(forKey: WEIGHTS_USER_DEFAULTS_KEY) as? [String] ?? []
        
        if weightsArr.count >= WEIGHTS_USER_DEFAULTS_MAX_COUNT {
            weightsArr = Array(weightsArr.suffix(WEIGHTS_USER_DEFAULTS_MAX_COUNT - 1))
        }
        weightsArr.append(conversion)
        UserDefaults.standard.set(weightsArr, forKey: WEIGHTS_USER_DEFAULTS_KEY)

        let alert = UIAlertController(title: "Success", message: "The weight conversion was successully saved!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
            textField = spStoneTextField
        }
        return textField!
    }
    
    func clearTextFields() {
        kilogramTextField.text = ""
        gramTextField.text = ""
        ounceTextField.text = ""
        poundTextField.text = ""
        spStoneTextField.text = ""
        spPoundTextField.text = ""
    }
    
    func retractKeyPressed() {
        keyboardWillHide()
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
