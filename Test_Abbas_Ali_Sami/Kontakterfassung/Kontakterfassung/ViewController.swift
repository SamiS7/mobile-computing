import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var streetNR: UITextField!
    @IBOutlet weak var plz: UITextField!
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func SaveButtonClickedd(_ sender: Any) {
        
    }
    
    @IBAction func lastNameTyped(_ sender: Any) {
        checkCount()
    }
    @IBAction func plzTyped(_ sender: Any) {
        checkCount()
    }
    @IBAction func placeTyped(_ sender: Any) {
        checkCount()
    }
    
    func checkCount() -> Bool {
        let check = (lastName.text!.count >= 2 && plz.text!.count == 4 && place.text!.count >= 2)
        saveButton.isEnabled = check
        return check
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return checkCount()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let summery = segue.destination as? SummeryViewController
        let adr = Adresse(firstName.text!, lastName.text!, street.text!, streetNR.text!, Int(plz.text!)!, place.text!)
        
        summery?.adresse = adr
    }
    
}

