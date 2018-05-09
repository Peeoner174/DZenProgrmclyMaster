
import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        
        //Цвет таб-бара
        tabBar.barTintColor = UIColor(red: 194, green: 31, blue: 31, alpha: 1)
        
        //Наполнение
        let oneController = createNavController(vc: ViewController_2(), image_icon: #imageLiteral(resourceName: "ic_ios_place"), title: "123")
        let twoController = createNavController(vc: ViewController(), image_icon: #imageLiteral(resourceName: "ic_ios_art_track"), title: "456")
        
        viewControllers = [oneController, twoController]
        
        //Регулировка расположения элементов таб-бара
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
        }
    }

}


