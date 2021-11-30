//
//  ResultViewController.swift
//  Hello world
//
//  Created by Witak Mathias on 16.11.21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var gamelogik:GameLogik?
    @IBOutlet weak var nbLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let unwrapped = gamelogik {
            nbLabel.text = "Anzahl der Versuche: \(unwrapped.numberOfGuesses)"
            print("\(unwrapped.numberOfGuesses)")
        }else {
            print("Missing noofGuesses")
        }
    }
    


     }
    

