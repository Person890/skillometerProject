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
    let icon: UIImage
    let segueID: String
    
    
    init(name: String, icon: UIImage, segueID: String) {
        self.name = name
        self.icon = icon
        self.segueID = segueID
    }
    
    func getConversionName() -> String {
        return name
    }
    
    func getConversionIcon() -> UIImage {
        return icon
    }
    
    func getSegueID() -> String {
        return segueID
    }
}
