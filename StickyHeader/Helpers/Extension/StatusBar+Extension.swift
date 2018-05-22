
import UIKit

/**
 Задать цвет для statusbar`a 
 UIApplication.shared.statusBarView?.backgroundColor = .red
 **/

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
