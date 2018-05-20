
import UIKit
import AlamofireImage

class ProductCell : UITableViewCell {
    let minValue = 0
    
    
    var button = Button()
    var productNameLabel : UILabel!
    var productDescriptionLabel : UILabel!
    var  productImage : UIImageView!
    var userImage : UIImageView!
    
    var product : Product? {
        didSet {
            do{
            productImage.af_setImage(withURL: try (product?.photo.asURL())!)
            }catch let loadImageEr{print("loadImageEr", loadImageEr)}
            productNameLabel.text = product?.title
            productDescriptionLabel.text = product?.date
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setProductImageIV()
        setProductNameL()
        setProductDescriptionL()
        setDropDownButton()
        setUserImageIV()
        
      	
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
///
    func setProductNameL() {
        //Создание и конфигурирование элементов ящейки
        productNameLabel = {
            let lbl = UILabel()
            lbl.textColor = .black
            lbl.font = UIFont.boldSystemFont(ofSize: 16)
            lbl.textAlignment = .left
            
            return lbl
        }()
        //Добавление элемента в viewController
        addSubview(productNameLabel)
        
        productNameLabel.anchor(top: topAnchor
            , left: productImage.rightAnchor
            , bottom: nil, right: nil
            , paddingTop: 10
            , paddingLeft: 10
            , paddingBottom: 0
            , paddingRight: 0
            , width: frame.size.width / 2
            , height: 0
            , enableInsets: false)
    }
 ///
    func setProductDescriptionL() {
        productDescriptionLabel = {
            let lbl = UILabel()
            lbl.textColor = .black
            lbl.font = UIFont.systemFont(ofSize: 16)
            lbl.textAlignment = .left
            lbl.numberOfLines = 0
            
            return lbl
        }()
        //Добавление элемента в viewController
        addSubview(productDescriptionLabel)
        
        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor
            , left: productImage.rightAnchor
            , bottom: nil, right: nil, paddingTop: 0
            , paddingLeft: 10, paddingBottom: 0
            , paddingRight: 0
            , width: frame.size.width / 2
            , height: 0
            , enableInsets: false)
    }
///
    func setProductImageIV() {
        productImage = {
            let imgView = UIImageView(image: #imageLiteral(resourceName: "profil"))
            imgView.contentMode = .scaleAspectFill
            
          
            imgView.clipsToBounds = true
            return imgView
        }()
        //Добавление элемента в viewController
        addSubview(productImage)
        
        productImage.anchor(top: topAnchor
            , left: leftAnchor
            , bottom: bottomAnchor
            , right: nil
            , paddingTop: 5
            , paddingLeft: 5
            , paddingBottom: 5
            , paddingRight: 0
            , width: 90
            , height: 0
            , enableInsets: false)
    }
    
    func setUserImageIV() {
        userImage = {
            let imgView = UIImageView(image: #imageLiteral(resourceName: "profil"))
           // imgView.contentMode = .scaleAspectFill
            imgView.layer.cornerRadius = 10
            imgView.layer.masksToBounds = true
              imgView.translatesAutoresizingMaskIntoConstraints = false
           // imgView.clipsToBounds = true
            return imgView
        }()
        //Добавление элемента в viewController
        addSubview(userImage)
        
        let constraints:[NSLayoutConstraint] = [
            //Расположение
            userImage.leftAnchor.constraint(equalTo: productImage.rightAnchor, constant: 10),
            userImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            //Размеры
            userImage.widthAnchor.constraint(equalToConstant: 20),
            userImage.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
        

    }
    
    func setDropDownButton(){
        
        //Конфигурация кнопки
        //Задание внешнего вида кнопки
        button.setImage(UIImage(named: "more"), for: .normal)
        
        
        //Когда констрейнты задаются в коде нужно ставить false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Button to the View Controller
        addSubview(button)
        
        //button Constraints
        let constraints:[NSLayoutConstraint] = [
            //Расположение
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            button.centerYAnchor.constraint(equalTo: topAnchor, constant: 20),
            //Размеры
            button.widthAnchor.constraint(equalToConstant: 20),
            button.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
        
        //drop down menu options
        button.dropView.dropDownOptions = ["Фотографии", "Заметки"]
        
    }
    
    
    
}



