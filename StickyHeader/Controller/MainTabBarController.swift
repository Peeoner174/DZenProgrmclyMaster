
import UIKit

class MainTabBarController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        
        //Цвет таб-бара
        tabBar.barTintColor = UIColor.white

        //Наполнение
        let oneController = createNavController(vc: GmapsController(), image_icon: #imageLiteral(resourceName: "ic_ios_place"), title: "Карта")
        let twoController = createNavController(vc: TapleController(), image_icon: #imageLiteral(resourceName: "ic_ios_art_track"), title: "Лента")
        let threeController = createNavController(vc: UserController(), image_icon: #imageLiteral(resourceName: "ic_ios_person"), title: "Профиль")
   
        viewControllers = [oneController, twoController, threeController]
        
        //Регулировка расположения элементов таб-бара
        guard let items = tabBar.items else { return }
        for item in items {
            print(item)
            item.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
        }
    }
    
    

}


