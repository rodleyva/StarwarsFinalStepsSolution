//
//  FilmDetailVC.swift
//  StarwarsFinalSteps
//
//  Created by Rodrigo Leyva on 10/21/21.
//

import UIKit

class FilmDetailVC: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var titletext: String?
    var director: String?
    var dateText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = dateText
        directorLabel.text = director
        titleLabel.text = titletext

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
