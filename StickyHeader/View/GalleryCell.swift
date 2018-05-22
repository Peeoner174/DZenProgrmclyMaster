
import UIKit
import AlamofireImage

class GalleryCell: UICollectionViewCell {
    
    var gallery: Gallery? {
        didSet {
            guard let galleryImage = gallery?.url else { return }
            do{
                galleImageVieW.af_setImage(withURL: try (galleryImage.asURL()))
            }catch let loadImageEr{print("loadImageEr", loadImageEr)}
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
       
    }
    
    func setup() {
        
        self.backgroundColor = UIColor.black
        
        self.addSubview(galleImageVieW)

        
        galleImageVieW.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)

    }
    
    let galleImageVieW: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
