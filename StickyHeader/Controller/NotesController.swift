
import UIKit


class NotesController: UITableViewController {
    
    var courses = [Course]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Course List"
        fetchJSON()
        
    }
    
    struct Course: Decodable {
        let id: Int
        let name: String
        let link: String
        
        //        let number_of_lessons: Int
        let numberOfLessons: Int
        let imageUrl: String
        
        // swift 4.0
        private enum CodingKeys: String, CodingKey {
            case imageUrl = "image_url"
            case numberOfLessons = "number_of_lessons"
            case id, name, link
        }
    }
    
    fileprivate func fetchJSON() {
        let urlString = "http://api.letsbuildthatapp.com/jsondecodable/courses_snake_case"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    // link in description for video on JSONDecoder
                    let decoder = JSONDecoder()
                    // Swift 4.1
                    // decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.courses = try decoder.decode([Course].self, from: data)
                    self.tableView.reloadData()
                } catch let jsonErr {
                    print("Failed to decode:", jsonErr)
                }
            }
            }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        let course = courses[indexPath.row]
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = String(course.numberOfLessons)
        cell.detailTextLabel?.textColor = UIColor.lightGray
        cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return cell
    }
    
}
