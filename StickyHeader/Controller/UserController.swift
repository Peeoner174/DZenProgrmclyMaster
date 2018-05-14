
import UIKit

class UserController: UIViewController {
    

    let cellId = "cellId"
    let cellId2 = "cellId2"
    
    var products : [Product]  = [Product]()
    var abouts : [About] = [About]()
   

    
    var segmentControl: SegmentedControlView!
    var tableView:UITableView!
    var headerView:CustomHeaderView!
    var headerHeightConstraint:NSLayoutConstraint!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setUpHeader()
        setSegmentedControl()
       // createAboutArray()
        createProductArray()
        
        setUpTableView()
        
    }

    func setUpHeader() {
        headerView = CustomHeaderView(frame: CGRect.zero, title: "user page")
        //Должен быть false, если констреинты описаны в коде
        headerView.translatesAutoresizingMaskIntoConstraints = false
        //Добавление элемента в viewController
        view.addSubview(headerView)
        
        //Задание констрейнтов с помощью Layout Anchors
        //Высота Header View в состоянии покоя
        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: 150)
        headerHeightConstraint.isActive = true
        
        let constraints:[NSLayoutConstraint] = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func segmentedValueChanged()
    {
        if segmentControl.segmentControl.selectedSegmentIndex == 0 {
            
            self.tableView.reloadData()
        }
        if segmentControl.segmentControl.selectedSegmentIndex == 1 {
           
            
            self.tableView.reloadData()
        }
    }
    
    func setSegmentedControl() {
        segmentControl = SegmentedControlView(frame: CGRect.zero)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.backgroundColor = UIColor.white
        segmentControl.segmentControl.selectedSegmentIndex = 1
        segmentControl.segmentControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        
        view.addSubview(segmentControl)
        
        let titlesConstraints:[NSLayoutConstraint] = [
            segmentControl.leftAnchor.constraint(equalTo: view.leftAnchor),
            segmentControl.rightAnchor.constraint(equalTo: view.rightAnchor),
            segmentControl.topAnchor.constraint(equalTo: headerView.bottomAnchor), //constant - дополнительный отступ относительно equalTo
            //segmentControl.bottomAnchor.constraint(equalTo: tableView.topAnchor)
            segmentControl.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(titlesConstraints)
    }
    
    func setUpTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        view.addSubview(tableView)
        
        let constraints:[NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 6),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        //Индетификатор для tableView
        tableView?.register(ProductCell.self, forCellReuseIdentifier: cellId)
        tableView?.register(ProductCell2.self, forCellReuseIdentifier: cellId2)

        
        /**
         UITableViewDataSource — набор методов, с помощью которых UITableView получает данные. Имеет три  обязательных метода:
         numberOfSectionsInTableView: — запрашивает количество секций, которые должны быть отображены;
         numberOfRowsInSection: — запрашивает количество ячеек, которые должны отображаться у каждой секции;
         cellForRowAtIndexPath: — запрашивает саму ячейку, для конкретной секции.
         **/
        tableView.dataSource = self
        
        /**
         UITableViewDelegate - механизм обратного вызова (callback), который позволяет «отлавливать» различные события, которые происходят с таблицей. Например:
         didSelectRowAtIndexPath: — вызывается когда юзер совершил нажатие на ячейку таблицы;
         willBeginEditingRowAtIndexPath: — вызывается в тот момент, когда ячейка только переходит в режим редактирования;
         heightForRowAtIndexPath: — вызывается когда таблице нужно знать высоту ячейки.
         **/
        tableView.delegate = self
    }
    
    //Header анимированно принимает свой первоночальный размер
    func animateHeader() {
        self.headerHeightConstraint.constant = 150 //Начальный размер
        UIView.animate(withDuration: 0.4 //скорость, с которой будет воспроизводиться анимация;
            , delay: 0.0
            , options: UIViewAnimationOptions() //Структура с опциями проигрывания анимации
            , animations: {
             self.view.layoutIfNeeded() //группирует все вложенные элементы в начальное состояние анимированно
            }, completion: nil)
    }

}


/**
 UIScrollViewDelegate - позволяет реагировать на операции(прокрутка, масштабирование и т.д.) определенные в классе UIScrollView
 **/
extension UserController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Когда пользователь скролит вверх
        if scrollView.contentOffset.y < 0 {
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y) //изменение размера
            headerView.incrementColorAlpha(self.headerHeightConstraint.constant) //Цвет
            headerView.incrementArticleAlpha(self.headerHeightConstraint.constant) //Картинка
            self.headerView.imageView.image = UIImage(named: "userBackground")

            
            //Задание максимального размера header`a
            if self.headerHeightConstraint.constant > 200{
                self.headerHeightConstraint.constant = 200
            }
            
            
        
            //Когда пользователь скролит вниз
        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 65 {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y/100
            headerView.decrementColorAlpha(scrollView.contentOffset.y)
            headerView.decrementArticleAlpha(self.headerHeightConstraint.constant)
            
            //Задание минимального размера header`a
            if self.headerHeightConstraint.constant < 65 {
                self.headerHeightConstraint.constant = 65
               self.headerView.imageView.image = UIImage(named: "Bez_imeni")
                //imageView.image = UIImage(named: "userBackground")
            }
            if self.headerHeightConstraint.constant > 65 {
                self.headerView.imageView.image = UIImage(named: "userBackground")
                //imageView.image = UIImage(named: "userBackground")
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
}


extension UserController:UITableViewDelegate {
    
}

extension UserController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentControl.segmentControl.selectedSegmentIndex == 0{
            return 5
               // abouts.count
            
        }
        else
    
        { return products.count}
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
            let identifier: String
            if segmentControl.segmentControl.selectedSegmentIndex == 0 {
                identifier = cellId2
                
                let cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
                //let course = abouts[indexPath.row]
                cell.textLabel?.text = "123"
                cell.detailTextLabel?.text = "456"
                cell.detailTextLabel?.textColor = UIColor.lightGray
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 13)
                return cell
                
//
//                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ProductCell2
//                cell.about = abouts[indexPath.row]
//                return cell
               
            }
                
            else    {
                
                identifier = cellId
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ProductCell
                cell.product = products[indexPath.row]
                return cell
                
  
            }
        
            
        }
            

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segmentControl.segmentControl.selectedSegmentIndex == 1 {

            return 100}
        else{return UITableViewAutomaticDimension
            
        }
    }
    
    
    func createProductArray() {
        products.append(Product(productName: "Рассвет", productImage: #imageLiteral(resourceName: "two") , productDesc: "Тест. Это заглушка"))
        products.append(Product(productName: "Пустыня", productImage: #imageLiteral(resourceName: "one") , productDesc: "Уазик )"))
        products.append(Product(productName: "Дома", productImage:  #imageLiteral(resourceName: "three"), productDesc: "Тестовое описание"))
        products.append(Product(productName: "Рассвет", productImage: #imageLiteral(resourceName: "two") , productDesc: "Тест. Это заглушка"))
        products.append(Product(productName: "Пустыня", productImage: #imageLiteral(resourceName: "one") , productDesc: "Уазик )"))
        products.append(Product(productName: "Дома", productImage:  #imageLiteral(resourceName: "three"), productDesc: "Тестовое описание"))
        products.append(Product(productName: "Рассвет", productImage: #imageLiteral(resourceName: "two") , productDesc: "Тест. Это заглушка"))
        products.append(Product(productName: "Пустыня", productImage: #imageLiteral(resourceName: "one") , productDesc: "Уазик )"))
        products.append(Product(productName: "Дома", productImage:  #imageLiteral(resourceName: "three"), productDesc: "Тестовое описание"))
        products.append(Product(productName: "Рассвет", productImage: #imageLiteral(resourceName: "two") , productDesc: "Тест. Это заглушка"))
        products.append(Product(productName: "Пустыня", productImage: #imageLiteral(resourceName: "one") , productDesc: "Уазик )"))
        products.append(Product(productName: "Дома", productImage:  #imageLiteral(resourceName: "three"), productDesc: "Тестовое описание"))
    }
    
//    func createAboutArray() {
//        abouts.append(About(productName: "Рассвет", productDesc: "Тест. Это заглушка"))
//        abouts.append(About(productName: "Пустыня", productDesc: "Уазик )"))
//        abouts.append(About(productName: "Дома", productDesc: "Тестовое описание"))
//    }
    
}



