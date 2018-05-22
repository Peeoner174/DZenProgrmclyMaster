
import UIKit
import Alamofire
import SwiftyJSON


class NotesController: UITableViewController {
    
    var abouts = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Заметки"
        createAboutArray()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abouts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        let note = abouts[indexPath.row]
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.note_text
        
        //Колличество строк detailTextLabel определяется размером контента
        cell.detailTextLabel?.lineBreakMode = .byWordWrapping
        cell.detailTextLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.textColor = UIColor.lightGray
        cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
//    func createAboutArray(){
//        abouts.append(About(id: "1", title: "1123", note_text: "123"))
//        abouts.append(About(id: "1", title: "1123", note_text: "123"))
//        abouts.append(About(id: "1", title: "1123", note_text: "123"))


        func createAboutArray() {
            
            let url = "http://139.59.139.197:8001/pavelk/note/note1/"
            
            Alamofire.request(url, method: .get).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    if json.dictionary!["success"] == true
                    {var data = json.dictionary!["data"]!
                        data = data["notes"]
                        
                        do {
                            let rawData = try data.rawData()
                            do {
                                let decoder = JSONDecoder()
                                self.abouts = try decoder.decode([Note].self, from: rawData)
                                self.tableView.reloadData()
                                
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

