import Foundation
class GameLogik {
    
    var numberToGuess = 0
    var numberOfGuesses = 0
    
    
    func startNewGame() {
        numberToGuess = Int.random(in: 1..<100)
        
        numberOfGuesses = 0
        
    }
    
    func evaluate(guess: Int) -> Int {
        
        let diff = guess - numberToGuess
        let result = diff.signum()
        print("number to guess: \(numberToGuess),result: \(result), guess: \(guess)")
        return result
    }
    func evaluate(string: String!) -> Int {
        
        let guess = Int(string)!
        
        return evaluate(guess: guess)
    }
    
    func isvalidguess(string: String?) -> Bool {
        //let int_t = Int(string ?? "-1") ??  -1
        //return int_t >= 0 && 99 >= int_t
        
        var isValid = false
        
        if let strg = string {
            let optionalNumber = Int(strg)
            
            if let guess =  optionalNumber  {
                    isValid = guess >= 1 && guess <= 99
            }
        }
        
        return isValid
        
            
    }
        
      
        
        
        
      
        
    
}
