//
//  ConstantsViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class ConstantsViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var constants = [Constant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // generate the history of the initial segment
        generateConstants()
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// This function generates the saved conversion history.
    /// It gains access to the user defaults and populates the
    /// history array.
    ///
    /// Usage:
    ///
    ///      generateHistory(type: conversionType, icon: icon)
    ///
    /// - Parameter type: Conversion type.
    ///             icon: Icon for the table cell.
    func generateConstants() {
        
        // building electron mass formula
        // formula: me = 9.10938356 × 10-31 kg
        let emFormula = NSMutableAttributedString()
        emFormula.append(stringFormatter(text: "1 m = 3.28 ft = 39.97 inch\n", location: 1, length: 1, type: "sub"))
        let em = Constant(name: "Distance", formula: emFormula, icon: UIImage(named: "ic_proton")!)
        
        // building proton mass formula
        // formula: pm = 1.6726219 × 10-27 kg
        let pmFormula = NSMutableAttributedString()
        pmFormula.append(stringFormatter(text: "F = 9/5 C + 32 ", location: 1, length: 1, type: "sub"))
        let pm = Constant(name: "Temperature", formula: pmFormula, icon: UIImage(named: "ic_proton")!)
        
        // building neutron mass formula
        // formula: nm = 1.674929 x 10-27 kg
        let nmFormula = NSMutableAttributedString()
        nmFormula.append(stringFormatter(text: "1 ml = 1 cc = 0.001 l", location: 1, length: 1, type: "sub"))
        let nm = Constant(name: "Volume", formula: nmFormula, icon: UIImage(named: "ic_neutron")!)
        
        // building electric permittivity
        // formula: ep = 8.854 × 10−12 C2/N m2
        let epFormula = NSMutableAttributedString()
        epFormula.append(stringFormatter(text: "1 mph = 1.60934 kmh ", location: 1, length: 1, type: "sub"))
        let ep = Constant(name: "Speed", formula: epFormula, icon: UIImage(named: "ic_electric")!)
        

        constants += [em, pm, nm, ep]
    }
    
    /// This function sets the number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /// This function returns the history count and shows a no data placeholder
    /// if there are no data to be shown.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return constants.count
    }
    
    /// This function generates the table cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ConstantTableViewCell
        cell.constantName.text = constants[indexPath.row].getName()
        cell.constantFormula.attributedText = constants[indexPath.row].getFormula()
        //cell.constantIcon.image = constants[indexPath.row].getIcon()
        
        // Card(cell) styles
        cell.isUserInteractionEnabled = false
        cell.contentView.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00)
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
    // This function formats a string to make superscript and subscript
    /// Usage:
    ///
    ///      stringFormatter(text: "μ0 = ", location: 1, length: 1, type: "sub")
    ///
    /// - Parameter text: text to format.
    ///             location: location to start the formating.
    ///             length: length of the formating text block.
    ///             type: formating type i.e superscript or subscript.
    /// - Returns: A formated text of type NSMutableAttributedString.
    func stringFormatter(text: String, location: Int = 0, length: Int = 0, type: String = "sup") -> NSMutableAttributedString {
        let font: UIFont? = UIFont(name: "Helvetica", size:20)
        let fontSupSub: UIFont? = UIFont(name: "Helvetica", size:10)
        let attString: NSMutableAttributedString = NSMutableAttributedString(string: text, attributes: [.font:font!])
        attString.setAttributes([.font:fontSupSub!,.baselineOffset: type == "sup" ? 10 : -10], range: NSRange(location: location,length: length))
        return attString;
    }
}
