
import UIKit

class DrDwnBtnContentView: UIView, UITableViewDelegate, UITableViewDataSource  {
    
   
    
    //Контент
    var dropDownOptions = [String]()

    //Внутри Drop-Down меню помещается TableView
    var tableView = UITableView()
    
    var delegate : DropDownBtProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        /**
         UITableViewDelegate - механизм обратного вызова (callback), который позволяет «отлавливать» различные события, которые происходят с таблицей. Например:
         didSelectRowAtIndexPath: — вызывается когда юзер совершил нажатие на ячейку таблицы;
         willBeginEditingRowAtIndexPath: — вызывается в тот момент, когда ячейка только переходит в режим редактирования;
         heightForRowAtIndexPath: — вызывается когда таблице нужно знать высоту ячейки.
         **/
        tableView.delegate = self
        
        /**
         UITableViewDataSource — набор методов, с помощью которых UITableView получает данные. Имеет три  обязательных метода:
         numberOfSectionsInTableView: — запрашивает количество секций, которые должны быть отображены;
         numberOfRowsInSection: — запрашивает количество ячеек, которые должны отображаться у каждой секции;
         cellForRowAtIndexPath: — запрашивает саму ячейку, для конкретной секции.
         **/
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.lightGray
        
        self.addSubview(tableView)
        
        let constraints:[NSLayoutConstraint] = [
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 28
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        //cell.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.1)
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
     
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(rowMenu: indexPath.row)
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        
        
      
      
        
        
        
        //        let navController = UINavigationController(rootViewController: )
//        navController.pushViewController(LoginController(), animated: true)


//        if indexPath.row == 0{
//
//            self.contro
//
//
//           self.navController.pushViewController(LoginController(), animated: true)
//
//
//
//        }else{
//                 }
//
    }

}
