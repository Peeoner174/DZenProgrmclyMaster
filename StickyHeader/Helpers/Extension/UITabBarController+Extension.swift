
import UIKit

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

