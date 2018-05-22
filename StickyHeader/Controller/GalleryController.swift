

import UIKit
import Alamofire
import SwiftyJSON

class GalleryController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
//    var photos = [Gallery(url: "one", name: "1"),
//                 Gallery(url: "two", name: "2"),
//              ]
     var photos : [Gallery] = [Gallery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.customStatusBarColor
        
        collectionView?.backgroundColor = UIColor.white
        
        navigationItem.title = "Photo"
        loadGallery()
        
        navigationController?.navigationBar.backgroundColor = UIColor.customMainRedColor

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
        
        collectionView?.register(GalleryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GalleryCell
        cell.gallery = photos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 4, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = photos[indexPath.item]
        let photo = PhotoController()
        photo.imageName = image.url!
        
        show(photo, sender: nil)
        
    }
    

    func loadGallery(){
        
        let url = "http://139.59.139.197:8001/pavelk/gallery/beatch/"
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                if json.dictionary!["success"] == true
                {var data = json.dictionary!["data"]!
                    data = data["images"]
                    
                    do {
                        let rawData = try data.rawData()
                        do {
                            let decoder = JSONDecoder()
                            self.photos = try decoder.decode([Gallery].self, from: rawData)
                            self.collectionView?.reloadData()
                            
                        } catch let jsonErr {
                            print("Failed to decode user:", jsonErr)
                        }
                    } catch {
                        print("Error raw data user \(error)")
                    }
                }
                else {
                    print(json.dictionary!["message"]!)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}









