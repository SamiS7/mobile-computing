//
//  Adresse.swift
//  Kontakterfassung
//
//  Created by Abbas Ali Sami on 07.12.21.
//

import Foundation
class Adresse {
    var firstName:String
    var lastName:String
    var street:String
    var streetNr:String
    var plz:Int
    var place:String
    
    init(_ fn:String,_ ln:String,_ str:String, _ strNr:String,_ plz:Int,_ place:String) {
        self.firstName = fn
        self.lastName = ln
        self.street = str
        self.streetNr = strNr
        self.plz = plz
        self.place = place
    }
    
}
