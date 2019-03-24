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
    
    init(name: String, icon: UIImage) {
        self.name = name
        self.icon = icon
    }
    
    func getConversionName() -> String {
        return name
    }
    
    func getConversionIcon() -> UIImage {
        return icon
    }
}
