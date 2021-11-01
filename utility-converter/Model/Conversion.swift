//
//  Conversion.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class Conversion {
    let name: String
    //let icon: UIImage
    let segueID: String
    let cellColour: UIColor
    
    
    init(name: String, segueID: String, cellColour: UIColor) {
        self.name = name
        //self.icon = icon
        self.segueID = segueID
        self.cellColour = cellColour
    }
    
    func getConversionName() -> String {
        return name
    }
    /*
    func getConversionIcon() -> UIImage {
        return icon
    }
    */
    func getSegueID() -> String {
        return segueID
    }
    
    func getCellColour() -> UIColor {
        return cellColour
    }
}
