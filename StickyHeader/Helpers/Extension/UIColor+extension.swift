
import UIKit

public extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var customLightBlueColor: UIColor = {
        return UIColor(r: 44, g: 57, b: 95)
    }()
    
    static var customRedColor: UIColor = {
        return UIColor(r: 217, g: 48, b: 80)
    }()
    
    static var customDarkBlueColor: UIColor = {
        return UIColor(r: 11, g: 22, b: 53)
    }()
    
    static var customMainRedColor: UIColor = {
        return UIColor(r: 245, g: 72, b: 66)
    }()
    
    static var customStatusBarColor: UIColor = {
        return UIColor(r: 251, g: 203, b: 202)
    }()
}
