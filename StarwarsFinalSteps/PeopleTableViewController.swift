//
//  ViewController.swift
//  StarwarsFinalSteps
//
//  Created by Rodrigo Leyva on 10/20/21.
//

import UIKit
import Alamofire

struct PeopleResult: Codable{
    let results : [People]
}

struct People: Codable{
    let name: String
    let mass: String
    let birth_year: String
    let gender: String
    let species: [String]
}

class PeopleTableViewController: UITableViewController {
    
    var peoples: [People] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarwarsModel.getAllPeople { model in
            if let model = model{
                DispatchQueue.main.async {
                    self.peoples = model.results
                    self.tableView.reloadData()
                }
            }
            
        }
        
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        cell.textLabel?.text = peoples[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoples.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //show a detaul view with all new attributes
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "people") as! PeopleDetailVC
        
        detailVC.birthYearText = peoples[indexPath.row].birth_year
        detailVC.nameText = peoples[indexPath.row].name
        detailVC.genderText = peoples[indexPath.row].gender
        detailVC.massText = peoples[indexPath.row].mass
        detailVC.species = peoples[indexPath.row].species
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }


}

