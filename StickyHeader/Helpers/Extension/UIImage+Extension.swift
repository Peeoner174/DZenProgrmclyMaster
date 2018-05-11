
import UIKit

/**
 //Изменение цвета иконок(UIImage) в коде
 **/
extension UIImage {
    func tint(with color: UIColor) -> UIImage {
        
        //Изменение цвета иконок в коде
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        
        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

