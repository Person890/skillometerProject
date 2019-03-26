//
//  TabBarController.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // instruct UITabBarController subclass to handle its own delegate methods
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is UINavigationController {
            print("Conversions tab")
        } else if viewController is SaveViewController {
            print("Save tab")
        } else if viewController is HistoryViewController {
            print("History tab")
        } else if viewController is ConstantsViewController {
            print("Constants tab")
        }
    }
}

