//
//  FilmTableViewController.swift
//  StarwarsFinalSteps
//
//  Created by Rodrigo Leyva on 10/20/21.
//

import UIKit
import Alamofire

struct FilmResult: Codable{
    let results: [Film]
}
struct Film: Codable{
    let title: String
    let director: String
    let release_date: String
    
}

class FilmTableViewController: UITableViewController {
    
    var films: [Film] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarwarsModel.getAllFilms { model in
            if let model = model{
                DispatchQueue.main.async {
                    self.films = model.results
                    self.tableView.reloadData()
                }
            }
            
        }
        

    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        cell.textLabel?.text = films[indexPath.row].title
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //show a detaul view with all new attributes
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "films") as! FilmDetailVC
        
        detailVC.titletext = films[indexPath.row].title
        detailVC.director = films[indexPath.row].director
        detailVC.dateText = films[indexPath.row].release_date
        
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    

}
