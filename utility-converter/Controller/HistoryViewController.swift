//
//  HistoryViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var histories = [History]()
    var conversionType = WEIGHTS_USER_DEFAULTS_KEY
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateHistory(type: conversionType, icon: UIImage(named: "ic_weight")!)
    }
    
    @IBAction func handleSegmentControlIndexChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            conversionType = WEIGHTS_USER_DEFAULTS_KEY
            generateHistory(type: conversionType, icon: UIImage(named: "ic_weight")!)
            DispatchQueue.main.async { self.tableView.reloadData() }
        case 1:
            conversionType = TEMP_USER_DEFAULTS_KEY
            generateHistory(type: conversionType, icon: UIImage(named: "ic_temperature")!)
            DispatchQueue.main.async { self.tableView.reloadData() }
        case 2:
            conversionType = VOLUME_USER_DEFAULTS_KEY
            generateHistory(type: conversionType, icon: UIImage(named: "ic_volume")!)
            DispatchQueue.main.async { self.tableView.reloadData() }
        case 3:
            conversionType = SPEED_USER_DEFAULTS_KEY
            generateHistory(type: conversionType, icon: UIImage(named: "ic_speed")!)
            DispatchQueue.main.async { self.tableView.reloadData() }
        default:
            break
        }
    }
    
    func generateHistory(type: String, icon: UIImage) {
        histories = []
        let historyList = UserDefaults.standard.value(forKey: conversionType) as? [String]
        
        if historyList?.count ?? 0 > 0 {
            for conersion in historyList! {
                let history = History(type: type,icon: icon,conversion: conersion)
                histories += [history]
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if histories.count == 0 {
            self.tableView.setEmptyMessage("No saved conversions found", UIColor.white)
        } else {
            self.tableView.restore()
        }
        
        return histories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryTableViewCell
        cell.historyConversionText.text = histories[indexPath.row].getHistoryConversion()
        cell.historyTypeIcon.image = histories[indexPath.row].getHistoryIcon()
            
        // Card(cell) styles
        cell.isUserInteractionEnabled = false
        cell.contentView.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00)
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = false
            
        return cell
    }
    
}
