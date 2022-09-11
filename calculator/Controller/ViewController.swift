//
//  ViewController.swift
//  calculator
//
//  Created by Ekrem Alkan on 8.09.2022.
//

import UIKit


class ViewController: UIViewController {

 
   
    
    @IBOutlet weak var resultLabel: UILabel!
    
   
    
    var finishedTypingNumber : Bool = true
    
    var resultValue: Double {
        get {
            guard let number = Double(resultLabel.text!) else {
            fatalError("Sonuc ekranindaki sayı Double'a donusturulemedi.")
                    }
            return number
            
        } set {
            resultLabel.text = String(newValue)
            
        }
        
    }
    
    
  var calculatorBrain = CalculatorBrain()
    
    
    @IBAction func calculationButtonClicked(_ sender: UIButton) {
        
        finishedTypingNumber = true
        
        calculatorBrain.pickNumber(number: resultValue)
        
        if let typeOfCalculation = sender.currentTitle {
            
             
            
            if let result = calculatorBrain.calculation(buttonType : typeOfCalculation){

                resultValue = result
            }
            
         
            }
        
        
    }
    
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
       
        let numberValueForDecimal = resultLabel.text!
        
        if let buttonCharacter = sender.currentTitle{
            
            let decimal = numberValueForDecimal.filter { $0 == "."}
            let decimalCount = decimal.count
            
        
           
            
            if decimalCount < 1{
                if finishedTypingNumber == false {
                
                if buttonCharacter == "." {
                    
                    let isInteger = floor(resultValue) == resultValue
                  
                    resultLabel.text = resultLabel.text! + buttonCharacter
                    
                    if isInteger == false {
                        print("22")
                        return
                    }
                    
                    
                }
                
                
                } }else {
                    
                }
            
            
            
        }
        
    }
    
    @IBAction func numberButtonClicked(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            
            if finishedTypingNumber == true {
                resultLabel.text = numberValue
                finishedTypingNumber = false
            } else {
                
                    
              
                   
            
                
                resultLabel.text = resultLabel.text! + numberValue
                      }
            
                
                }
            
            
        }
        
            
  
        
        
        
    
    
    @IBAction func deleteLastCharacter(_ sender: UIButton) {
        
        finishedTypingNumber = false
        var name: String = resultLabel.text!
        if name.count > 1 {
            name.remove(at: name.index(before: name.endIndex))
            resultLabel.text = name
                                      }
        else{
                resultLabel.text = "0"
                finishedTypingNumber = true
               }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
            
        
        
    }
}





