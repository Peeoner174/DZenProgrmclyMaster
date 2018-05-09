import UIKit

class CustomHeaderView: UIView {

    var imageView:UIImageView!
    var colorView:UIView!
    var bgColor = UIColor(red: 235/255, green: 96/255, blue: 91/255, alpha: 1)
    var titleLabel = UILabel()
    var articleIcon:UIImageView!
  
    init(frame:CGRect,title: String) {
        self.titleLabel.text = title.uppercased()
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.backgroundColor = UIColor.white
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        
        let constraints:[NSLayoutConstraint] = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.leftAnchor.constraint(equalTo: self.leftAnchor),
            colorView.rightAnchor.constraint(equalTo: self.rightAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        //Задаем background картинку
        imageView.image = UIImage(named: "userBackground")
        imageView.contentMode = .scaleAspectFill //картинка не растягивается под View, а обрезается
        
        colorView.backgroundColor = bgColor
        colorView.alpha = 0.6 //Уровень прозрачности
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        let titlesConstraints:[NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 28), //constant - доболнительный отступ относительно equalTo
        ]
        NSLayoutConstraint.activate(titlesConstraints)
        
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        
        articleIcon = UIImageView()
        articleIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(articleIcon)
        
        let imageConstraints:[NSLayoutConstraint] = [
            //Задание расположения
            articleIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            articleIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 6),
            //Задание размеров
            articleIcon.widthAnchor.constraint(equalToConstant: 60),
            articleIcon.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(imageConstraints)
        
        articleIcon.image = UIImage(named: "user")
        articleIcon.layer.cornerRadius = 10
        articleIcon.layer.masksToBounds = true
        articleIcon.contentMode = .scaleAspectFill
    }
    
    //Функция, увеличивающая уровень прозрачности фона
    func decrementColorAlpha(_ offset: CGFloat) {
        if self.colorView.alpha <= 1 {
            let alphaOffset = (offset/500)/85
            self.colorView.alpha += alphaOffset
        }
    }
    
    // увеличивает прозрачность картинки
    func decrementArticleAlpha(_ offset: CGFloat) {
        if self.articleIcon.alpha >= 0 {
            let alphaOffset = max((offset - 65)/85.0, 0)
            self.articleIcon.alpha = alphaOffset
          
        }
    }
    
    func incrementColorAlpha(_ offset: CGFloat) {
        if self.colorView.alpha >= 0.6 {
            let alphaOffset = (offset/200)/85
            self.colorView.alpha -= alphaOffset
        }
    }
    
    func incrementArticleAlpha(_ offset: CGFloat) {
        if self.articleIcon.alpha <= 1 {
            let alphaOffset = max((offset - 65)/85, 0)
            self.articleIcon.alpha = alphaOffset
        }
    }

}
