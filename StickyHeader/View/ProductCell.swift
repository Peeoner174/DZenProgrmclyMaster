
import UIKit

class ProductCell : UITableViewCell {
    let minValue = 0
    
    
     
    var productNameLabel : UILabel!
    var productDescriptionLabel : UILabel!
    var  productImage : UIImageView!
    
    var product : Product? {
        didSet {
            productImage.image = product?.productImage
            productNameLabel.text = product?.productName
            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setProductImageIV()
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
            , left: productImage.rightAnchor
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
    
}


