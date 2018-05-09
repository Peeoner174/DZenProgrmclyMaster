
import UIKit

/**Позволяет более кратко описывать констрейнты **/
//Идея этого экстеншина взята с letsbuildthatapp.com
extension UIView {
    
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
            
            print("Top: \(topInset)")
            print("bottom: \(bottomInset)")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
}

/**
 Настройка Tab Bara
 Наполнение контентом, обработка нажатий на элементы меню таб бара
 **/
extension UITabBarController {
    
    func createNavController(vc: UIViewController, image_icon: UIImage, title: String?) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        
        //Задание текста, иконок меню и цвета иконок(selected and unselected)
        navController.tabBarItem.image = image_icon.tint(with: UIColor.blue)
        navController.tabBarItem.title = title
        navController.tabBarItem.selectedImage = image_icon.tint(with: UIColor.brown)
        
        return navController
    }
}

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


