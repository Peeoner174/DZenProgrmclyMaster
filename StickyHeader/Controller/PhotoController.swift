
import UIKit
import AlamofireImage

class PhotoController: UIViewController {
    
    var photoImage: UIImageView!
    var imageName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        
        view.backgroundColor = UIColor.black
        
        setPhotoIV(imageName: imageName)
}
    
    func setPhotoIV(imageName: String?) {
        photoImage = {
            let imageView = UIImageView()
            imageView.image = UIImage()
            
            do{
                imageView.af_setImage(withURL: try (imageName!.asURL()))
            }catch let loadImageEr{print("Ошибка загрузки фото(PhotoController)", loadImageEr)}
            
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        //Добавление элемента в viewController
        view.addSubview(photoImage)
        
        let constraints:[NSLayoutConstraint] = [
            photoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            photoImage.widthAnchor.constraint(equalToConstant: view.frame.width)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func setNavBar(){

        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)
        ]
    }
    
    
}
