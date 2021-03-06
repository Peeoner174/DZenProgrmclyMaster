
import UIKit

/**
Внешний вид Frame`a drop-down меню и его поведение(анимация)
**/

class DropDownBtn: UIButton, DropDownBtProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        dropView = DrDwnBtnContentView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.delegate = self

        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //Выполняется когда какое-то из меню в drop-down было выбрано
    func dropDownPressed(rowMenu: Int)  {
        self.closeDropDown()
        print(rowMenu)
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if rowMenu == 0{
                let two = UINavigationController()
                two.pushViewController(GalleryController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
                topController.present(two, animated: true, completion: nil)
            }
            else {
                let one = UINavigationController()
                one.pushViewController(NotesController(), animated: true)
                topController.present(one, animated: true, completion: nil)
            }
            
        }
    
    }
    
    

    
    
    var dropView = DrDwnBtnContentView()
    
    var height = NSLayoutConstraint()
    
    override func didMoveToSuperview() {
        //добавление drop-down menu в view controller
        self.superview?.addSubview(dropView)
        //Drop-down menu отображается повверх остальных View
        self.superview?.bringSubview(toFront: dropView)
        
        let constraints:[NSLayoutConstraint] = [
            //Расположение
            dropView.topAnchor.constraint(equalTo: self.bottomAnchor),
            dropView.rightAnchor.constraint(equalTo: self.leftAnchor),
            //Размеры
            dropView.widthAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(constraints)
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
        //dropView.layer.sha
        
        dropView.layer.shadowRadius = 1.0
        dropView.layer.shadowOpacity = 0.6
        dropView.layer.shadowOffset = CGSize.zero
    }
    
    //При открытии drop-down menu
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            //Анимация раскрытия списка
            discloseDropDown()
            
        } else {
            //Анимация закрытия списка (в данном случае по повторному нажатию на кнопку)
            closeDropDown()
        }
    }
    
    //Анимация сворачивания drop down menu
    func closeDropDown() {
        isOpen = false
        
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    func discloseDropDown() {        
        isOpen = true
        
        //Вычисляется высота окна drop-down menu
        NSLayoutConstraint.deactivate([self.height])//сброс пред. настроек высоты окна
        if self.dropView.tableView.contentSize.height > 56 {
            self.height.constant = 56
        } else {
            self.height.constant = self.dropView.tableView.contentSize.height
        }
        NSLayoutConstraint.activate([self.height])//Установка новых
        
        //Анимация раскрытия списка drop-down menu
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.dropView.layoutIfNeeded()
            
            //точка, откуда будет начинаться анимация
            self.dropView.center.y += self.dropView.frame.height/2
        }, completion: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}








