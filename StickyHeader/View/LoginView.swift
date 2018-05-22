
import UIKit

class LoginView: UIView {
    
    var loginAction: (() -> Void)?
    var signupAction: (() -> Void)?
    
    var logoImageView: UIImageView!
    var appNameLabel: UILabel!
    var sloganLabel: UILabel!
    var userLoginTxtField: UITextField!
    var userPasswordTxtField: UITextField!
    var signInBt: UIButton!
    var registerBt: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        setLogoIV()
        setAppNameL()
        setSloganL()
        setUserLoginTF()
        setUserPasswordTF()
        setSignInBt()
        setregisterBt()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///
    func setLogoIV() {
        logoImageView = {
            let imageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
            //enables autolayout
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        //Добавление элемента в viewController
        addSubview(logoImageView)
        
        let constraints:[NSLayoutConstraint] = [
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setAppNameL() {
        appNameLabel = {
            let textView = UILabel()
            textView.text = "DZen"
            textView.font = UIFont.boldSystemFont(ofSize: 17)
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.textAlignment = .center
            return textView
        }()
        //Добавление элемента в viewController
        addSubview(appNameLabel)
        
        let constraints:[NSLayoutConstraint] = [
            appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 2),
            appNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setSloganL() {
        sloganLabel = {
            let textView = UILabel()
            textView.text = "Made Travel Easy"
            textView.font = UIFont.boldSystemFont(ofSize: 12)
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.textAlignment = .center
            textView.textColor = UIColor.gray
            return textView
        }()
        addSubview(sloganLabel)
        
        let constraints:[NSLayoutConstraint] = [
            sloganLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 2),
            sloganLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUserLoginTF() {
        userLoginTxtField = {
            let textField = UITextField()
            textField.placeholder = "Логин"
            textField.font = UIFont.boldSystemFont(ofSize: 17)
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.textAlignment = .left
            textField.textColor = UIColor.black
            textField.borderStyle = .roundedRect
            return textField
        }()
        addSubview(userLoginTxtField)
        
        let constraints:[NSLayoutConstraint] = [
            userLoginTxtField.topAnchor.constraint(equalTo: sloganLabel.bottomAnchor, constant: 33),
            userLoginTxtField.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            userLoginTxtField.rightAnchor.constraint(equalTo: rightAnchor, constant: -4)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUserPasswordTF() {
        userPasswordTxtField = {
            let textField = UITextField()
            textField.placeholder = "Пароль"
            textField.font = UIFont.boldSystemFont(ofSize: 17)
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.textAlignment = .left
            textField.textColor = UIColor.black
            textField.borderStyle = .roundedRect
            return textField
        }()
        addSubview(userPasswordTxtField)
        
        let constraints:[NSLayoutConstraint] = [
            userPasswordTxtField.topAnchor.constraint(equalTo: userLoginTxtField.bottomAnchor, constant: 8),
            userPasswordTxtField.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            userPasswordTxtField.rightAnchor.constraint(equalTo: rightAnchor, constant: -4)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setSignInBt(){
        signInBt = {
            let button = UIButton(type: UIButtonType.system)
            button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Войти", for: UIControlState.normal)
            button.setTitleColor(UIColor.white, for: UIControlState.normal)
            button.backgroundColor = UIColor.customMainRedColor
            button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
            return button
        }()
        addSubview(signInBt)
        
        let constraints:[NSLayoutConstraint] = [
            signInBt.topAnchor.constraint(equalTo: userPasswordTxtField.bottomAnchor, constant: 8),
            signInBt.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInBt.widthAnchor.constraint(equalToConstant: 150),
            signInBt.heightAnchor.constraint(equalToConstant: 35)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func setregisterBt(){
        registerBt = {
            let button = UIButton(type: UIButtonType.system)
            button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("ЗАРЕГЕСТРИРОВАТЬСЯ", for: UIControlState.normal)
            button.setTitleColor(UIColor.customMainRedColor, for: UIControlState.normal)
            button.sizeToFit()
            button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
            return button
        }()
        addSubview(registerBt)
        
        let constraints:[NSLayoutConstraint] = [
            registerBt.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            registerBt.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerBt.heightAnchor.constraint(equalToConstant: 35)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func handleLogin() {
        loginAction?()
    }
    
    @objc func handleSignup() {
        signupAction?()
    }
}
