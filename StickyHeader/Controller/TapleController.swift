
import UIKit
import Alamofire
import SwiftyJSON

class TapleController: UITableViewController{
    let cellId = "cellId"
    var products : [Product]  = [Product]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.customStatusBarColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        
        ProductDataLoader()
        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
        let currentLastItem = products[indexPath.row]
        cell.product = currentLastItem
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func ProductDataLoader() {
        let url = "http://139.59.139.197:8001/pavelk/history/0/"
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                if json.dictionary!["success"] == true
                {let data = json.dictionary!["data"]!
                    
                    
                    do {
                        let rawData = try data.rawData()
                        do {
                            let decoder = JSONDecoder()
                            self.products = try decoder.decode([Product].self, from: rawData)
                            self.tableView.reloadData()
                            
                        } catch let jsonErr {
                            print("Failed to decode product:", jsonErr)
                        }
                    } catch {
                        print("Error raw data \(error)")
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
    
    func setNavBar()  {
        navigationItem.title = "Лента"
        navigationController?.navigationBar.backgroundColor = UIColor.customMainRedColor
        navigationController?.navigationBar.titleTextAttributes = [
               NSAttributedStringKey.foregroundColor: UIColor.white,
               NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)
        ]
    }
    
}


