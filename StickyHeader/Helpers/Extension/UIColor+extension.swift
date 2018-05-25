
import UIKit

public extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var customRedColor: UIColor = {
        return UIColor(r: 217, g: 48, b: 80)
    }()
    
    //red: 235/255, green: 96/255, blue: 91/255, alpha: 1)
    static var customMainRedColor: UIColor = {
        return UIColor(r: 235, g: 96, b: 91)
    }()
    
    static var customStatusBarColor: UIColor = {
        return UIColor(r: 251, g: 203, b: 202)
    }()
}
