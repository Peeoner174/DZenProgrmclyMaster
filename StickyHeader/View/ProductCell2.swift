
import UIKit

class ProductCell2 : UITableViewCell {
    let minValue = 0
    
    var productNameLabel : UILabel!
    var productDescriptionLabel : UILabel!
    
    
    var about : About? {
        didSet {
            
            productNameLabel.text = about?.productName
            productDescriptionLabel.text = about?.productDesc
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setProductNameL()
        setProductDescriptionL()
        
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
            , left: rightAnchor
            , bottom: nil, right: nil
            , paddingTop: 20
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
            , left: rightAnchor
            , bottom: nil, right: nil, paddingTop: 0
            , paddingLeft: 10, paddingBottom: 0
            , paddingRight: 0
            , width: frame.size.width / 2
            , height: 0
            , enableInsets: false)
    }
    ///
    
    
}


