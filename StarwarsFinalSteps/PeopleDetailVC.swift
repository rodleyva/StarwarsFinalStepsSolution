//
//  PeopleDetailVC.swift
//  StarwarsFinalSteps
//
//  Created by Rodrigo Leyva on 10/21/21.
//

import UIKit

struct Species: Codable{
    let name: String
}

class PeopleDetailVC: UIViewController {

    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var nameLabe: UILabel!
    
    @IBOutlet weak var speciesLabel: UILabel!
    
    var massText: String?
    var birthYearText: String?
    var nameText: String?
    var genderText: String?
    
    var species: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gender.text = genderText
        mass.text = massText
        nameLabe.text = nameText
        birthYear.text = birthYearText
        
        if let species = species {
            if !species.isEmpty{
                guard let url = species.first else{return}
                StarwarsModel.getSpecies(urlString: url) { model in
                    DispatchQueue.main.async {
                        self.speciesLabel.text = model?.name
                    }
                }
            }
        }
        
       

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
