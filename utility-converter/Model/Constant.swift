//
//  Constant.swift
//  utility-converter
//
//  Created by Brion Silva on 09/04/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//
import UIKit

class Constant {
    let name: String
    let formula: NSMutableAttributedString
    let icon: UIImage
    
    init(name: String, formula: NSMutableAttributedString, icon: UIImage) {
        self.name = name
        self.formula = formula
        self.icon = icon
    }
    
    func getName() -> String {
        return name
    }
    
    func getIcon() -> UIImage {
        return icon
    }
    
    func getFormula() -> NSMutableAttributedString {
        return formula
    }
}
