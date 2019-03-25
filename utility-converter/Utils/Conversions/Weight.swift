//
//  Weight.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

enum Weight: Int {
    case kilograms = 0, grams, ounces, pounds, stonePounds
    
    func convert(unit to: Weight, output val: Double) -> Double {
        var output = 0.0
        switch self {
        case .kilograms:
            if to == .grams {
                output = 1000 * val
            }
        case .grams:
            if to == .kilograms {
                output = val / 1000
            }
        case .ounces:
            output = 0.0
        case .pounds:
            output = 0.0
        case .stonePounds:
            output = 0.0
        }
        return output
    }
    
    static func fromString(_ string: String) -> Weight? {
        if string == "kilograms" {
            return .kilograms
        } else if string == "grams" {
            return .grams
        } else if string == "ounces" {
            return .ounces
        } else if string == "pounds" {
            return .pounds
        } else if string == "stonePounds" {
            return .stonePounds
        } else {
            return nil
        }
    }
}
