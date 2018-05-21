
import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        
        //Цвет таб-бара
        tabBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        
        //Наполнение
        let oneController = createNavController(vc: GmapsController(), image_icon: #imageLiteral(resourceName: "ic_ios_place"), title: "123")
        let twoController = createNavController(vc: UserController(), image_icon: #imageLiteral(resourceName: "ic_ios_art_track"), title: "456")
        let threeController = createNavController(vc: TapleController(), image_icon: #imageLiteral(resourceName: "ic_ios_place"), title: "789")
      
        
        viewControllers = [oneController, twoController, threeController]
        
        //Регулировка расположения элементов таб-бара
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
        }
    }

}


