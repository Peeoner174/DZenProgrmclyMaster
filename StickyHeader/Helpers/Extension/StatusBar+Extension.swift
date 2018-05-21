
import UIKit

/**
 Позволяет задавать цвет для statusbar`a для каждого контроллера одной строчкой кода:
 UIApplication.shared.statusBarView?.backgroundColor = .red
 **/

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
