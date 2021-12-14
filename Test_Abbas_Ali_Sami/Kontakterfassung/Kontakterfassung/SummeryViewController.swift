//
//  SummeryViewController.swift
//  Kontakterfassung
//
//  Created by Abbas Ali Sami on 07.12.21.
//

import UIKit

class SummeryViewController: UIViewController {
    var adresse:Adresse?
    @IBOutlet weak var fn: UILabel!
    
    @IBOutlet weak var ln: UILabel!
    
    @IBOutlet weak var plzOrt: UILabel!
    @IBOutlet weak var str: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fn.text = adresse!.firstName
        ln.text = adresse!.lastName
        str.text = "\(adresse!.street) \(adresse!.streetNr)"
        plzOrt.text = "\(adresse!.plz)  \(adresse!.place)"
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
