
import UIKit

class TapleController: UITableViewController {
    
    let cellId = "cellId"
    var products : [Product]  = [Product]()
    

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "Course List"
        navigationController?.navigationBar.backgroundColor = UIColor.blue

        
        createProductArray()
        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func createProductArray() {
        products.append(Product(productName: "Glasses", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is best Glasses I've ever seen"))
        products.append(Product(productName: "Desert", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is so yummy"))
        products.append(Product(productName: "Camera Lens", productImage:  #imageLiteral(resourceName: "one"), productDesc: "I wish I had this camera lens"))
        products.append(Product(productName: "Glasses", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is best Glasses I've ever seen"))
        products.append(Product(productName: "Desert", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is so yummy"))
        products.append(Product(productName: "Camera Lens", productImage:  #imageLiteral(resourceName: "one"), productDesc: "I wish I had this camera lens"))
        products.append(Product(productName: "Glasses", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is best Glasses I've ever seen"))
        products.append(Product(productName: "Desert", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is so yummy"))
        products.append(Product(productName: "Camera Lens", productImage:  #imageLiteral(resourceName: "one"), productDesc: "I wish I had this camera lens"))
        products.append(Product(productName: "Glasses", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is best Glasses I've ever seen"))
        products.append(Product(productName: "Desert", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is so yummy"))
        products.append(Product(productName: "Camera Lens", productImage:  #imageLiteral(resourceName: "one"), productDesc: "I wish I had this camera lens"))
        products.append(Product(productName: "Glasses", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is best Glasses I've ever seen"))
        products.append(Product(productName: "Desert", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is so yummy"))
        products.append(Product(productName: "Camera Lens", productImage:  #imageLiteral(resourceName: "one"), productDesc: "I wish I had this camera lens"))
        products.append(Product(productName: "Glasses", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is best Glasses I've ever seen"))
        products.append(Product(productName: "Desert", productImage: #imageLiteral(resourceName: "one") , productDesc: "This is so yummy"))
        products.append(Product(productName: "Camera Lens", productImage:  #imageLiteral(resourceName: "one"), productDesc: "I wish I had this camera lens"))
    }
    
    
    
}

