
import UIKit
import Alamofire
import SwiftyJSON

class LoginController: UIViewController {
    
    var signView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let url = "http://139.59.139.197:8001/pavelk/user/0/"
    
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json.dictionary!["success"] == true
                {print(json.dictionary!["data"]!)                                                          }
                    else {
                        let noFoundEr = json.dictionary!["message"]
                        print(noFoundEr!)
                    }
            case .failure(let error):
                print(error)
            }
        }
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











