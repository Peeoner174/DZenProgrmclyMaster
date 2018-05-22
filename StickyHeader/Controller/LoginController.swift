
import UIKit
import Alamofire
import SwiftyJSON

class LoginController: UIViewController {
    
    var signView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        signView = {
            let imageView = LoginView()
            imageView.loginAction = loginPressed
            imageView.signupAction = signupPressed
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        view.addSubview(signView)
        
        let constraints:[NSLayoutConstraint] = [
            signView.topAnchor.constraint(equalTo: view.topAnchor),
            signView.leftAnchor.constraint(equalTo: view.leftAnchor),
            signView.rightAnchor.constraint(equalTo: view.rightAnchor),
            signView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func loginPressed() {
        print("login button pressed")
        
    }
    
    func signupPressed() {
        let signUpVC = MainTabBarController()
        present(signUpVC, animated: true, completion: nil)
    }
    
}











