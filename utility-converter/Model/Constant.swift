
import UIKit

class Constant {
    let name: String
    let formula: NSMutableAttributedString
    //let icon: UIImage
    
    init(name: String, formula: NSMutableAttributedString) {
        self.name = name
        self.formula = formula
        //self.icon = icon
    }
    
    func getName() -> String {
        return name
    }
    /*
    func getIcon() -> UIImage {
        return icon
    }
    */
    
    func getFormula() -> NSMutableAttributedString {
        return formula
    }
}
