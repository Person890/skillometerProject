//
//  UITextField+CustomNumericKeyboard.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//
import UIKit

private var numericKeyboardDelegate: CustomNumericKeyboardDelegate? = nil

extension UITextField: CustomNumericKeyboardDelegate {
    
    // MARK: - Public methods to set or unset this uitextfield as NumericKeyboard.
    
    func setAsNumericKeyboard(delegate: CustomNumericKeyboardDelegate?) {
        let numericKeyboard = CustomNumericKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: customNKbRecommendedHeight))
        self.inputView = numericKeyboard
        numericKeyboardDelegate = delegate
        numericKeyboard.delegate = self
    }
    
    func unsetAsNumericKeyboard() {
        if let numericKeyboard = self.inputView as? CustomNumericKeyboard {
            numericKeyboard.delegate = nil
        }
        self.inputView = nil
        numericKeyboardDelegate = nil
    }
    
    // MARK: - NumericKeyboardDelegate methods
    
    internal func numericKeyPressed(key: Int) {
        self.text?.append("\(key)")
        numericKeyboardDelegate?.numericKeyPressed(key: key)
    }
    
    internal func numericBackspacePressed() {
        if var text = self.text, text.count > 0 {
            _ = text.remove(at: text.index(before: text.endIndex))
            self.text = text
        }
        numericKeyboardDelegate?.numericBackspacePressed()
    }
    
    internal func numericSymbolPressed(symbol: String) {
        self.text?.append(symbol)
        numericKeyboardDelegate?.numericSymbolPressed(symbol: symbol)
    }
    
    internal func retractKeyPressed() {
        print("close keyboard")
    }
}
