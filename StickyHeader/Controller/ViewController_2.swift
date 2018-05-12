import UIKit
/**
 
 */
class ViewController_2: UITableView {

    var button = Button()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        setDropDownButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setDropDownButton(){
        
        //Конфигурация кнопки
        //Задание внешнего вида кнопки
        button.setImage(UIImage(named: "ic_ios_place"), for: .normal)
        
        //Когда констрейнты задаются в коде нужно ставить false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Button to the View Controller
        self.view.addSubview(button)
        
        //button Constraints
        let constraints:[NSLayoutConstraint] = [
            //Расположение
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            //Размеры
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(constraints)
  
        //drop down menu options
        button.dropView.dropDownOptions = ["Фотографии", "Заметки", "About it"]
        
    }
    
}

class Button: DropDownBtn {
    override func dropDownPressed() {
        super.dropDownPressed()
        
    }
}
















