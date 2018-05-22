
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
        let oneController = createNavController(vc: GmapsController(), image_icon: #imageLiteral(resourceName: "ic_ios_place"), title: "Карта")
        let twoController = createNavController(vc: NotesController(), image_icon: #imageLiteral(resourceName: "ic_ios_art_track"), title: "Заметки")
        let threeController = createNavController(vc: GalleryController(collectionViewLayout: UICollectionViewFlowLayout()), image_icon: #imageLiteral(resourceName: "ic_ios_place"), title: "Галерея")
        let fourController = createNavController(vc: TapleController(), image_icon: #imageLiteral(resourceName: "ic_ios_place"), title: "Лента")
        let fiveController = createNavController(vc: UserController(), image_icon: #imageLiteral(resourceName: "ic_ios_place"), title: "Профиль")
        
        viewControllers = [oneController, twoController, threeController, fourController, fiveController]
        
        //Регулировка расположения элементов таб-бара
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
        }
    }

}


