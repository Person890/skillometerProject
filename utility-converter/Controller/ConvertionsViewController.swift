//
//  FirstViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 19/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class ConvertionsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var conversions = [Conversion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateConversions()
    }
    
    /// This function generates the differect conversion types supported
    /// by the application.
    ///
    /// Usage:
    ///
    ///      generateConversions()
    func generateConversions() {
        let weight = Conversion(name: "Weight", segueID: "goToWeightConversion", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
        let temperature = Conversion(name: "Tempertaure", segueID: "goToTemperatureConversion", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
        let volume = Conversion(name: "Volume", segueID: "goToVolumeConversion", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
        let distance = Conversion(name: "Distance", segueID: "goToDistanceConversion", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
        let speed = Conversion(name: "Speed", segueID: "goToSpeedConversion", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
        
        conversions += [weight, temperature, volume, distance, speed]
    }
    
    /// This function returns the conversions count to be used in the collection view.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conversions.count
    }
    
    /// This function generates the collection view cell.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ConversionViewCell
        cell.conversionName.text = conversions[indexPath.row].getConversionName()
//        cell.conversionIcon.image = conversions[indexPath.row].getConversionIcon()
        
        //Card(cell) styles
        cell.contentView.backgroundColor = conversions[indexPath.row].getCellColour()
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
    // This function is called when an item in the collection view is selected.
    // performSegue() method will help navigate to the specified conversion page.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: conversions[indexPath.row].getSegueID(), sender: self)
    }
}

