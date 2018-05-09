import UIKit

class ViewController: UIViewController {

    let cellId = "cellId"
    var products : [Product]  = [Product]()
    
    var tableView:UITableView!
    var headerView:CustomHeaderView!
    var headerHeightConstraint:NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setUpHeader()
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
    
    func setUpTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        let constraints:[NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        //Индетификатор для tableView
        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
        
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
 UIScrollViewDelegate - позволяет реагировать на операции(прокрутка, масштабирование и т.д., определенные в классе UIScrollView)
 **/
extension ViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Когда пользователь скролит вверх
        if scrollView.contentOffset.y < 0 {
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y) //изменение размера
            headerView.incrementColorAlpha(self.headerHeightConstraint.constant) //Цвет
            headerView.incrementArticleAlpha(self.headerHeightConstraint.constant) //Картинка
            
            //Задание максимального размера header`a
            if self.headerHeightConstraint.constant > 300{
                self.headerHeightConstraint.constant = 300
            }
        
            //Когда пользователь скролит вниз
        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 65 {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y/100
            headerView.decrementColorAlpha(scrollView.contentOffset.y)
            headerView.decrementArticleAlpha(self.headerHeightConstraint.constant)
            
            //Задание минимального размера header`a
            if self.headerHeightConstraint.constant < 65 {
                self.headerHeightConstraint.constant = 65
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
}


extension ViewController:UITableViewDelegate {
    
}

extension ViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ProductCell
        let currentLastItem = products[indexPath.row]
        cell.product = currentLastItem
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
}

