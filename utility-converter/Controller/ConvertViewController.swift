//
//  FirstViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 19/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var conversions = [Conversion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateConversions()
    }
    
    func generateConversions() {
        let weight = Conversion(name: "Weight", icon: UIImage(named: "ic_weight")!)
        let temperature = Conversion(name: "Tempertaure", icon: UIImage(named: "ic_temperature")!)
        let volume = Conversion(name: "Volume", icon: UIImage(named: "ic_volume")!)
        let liquidVolumes = Conversion(name: "Liquid Volume", icon: UIImage(named: "ic_liquid")!)
        let distance = Conversion(name: "Distance", icon: UIImage(named: "ic_distance")!)
        let speed = Conversion(name: "Speed", icon: UIImage(named: "ic_speed")!)
        
        conversions += [weight, temperature, volume, liquidVolumes, distance, speed]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conversions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ConversionViewCell
        cell.conversionName.text = conversions[indexPath.row].getConversionName()
        cell.conversionIcon.image = conversions[indexPath.row].getConversionIcon()
        
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 8.0
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
}

