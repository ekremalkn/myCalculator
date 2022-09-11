//
//  CalculatorBrain.swift
//  calculator
//
//  Created by Ekrem Alkan on 9.09.2022.
//

import Foundation

struct CalculatorBrain {

    var number : Double?
    
  var calculation1 : (n1: Double, typeOfCalculation2: String)?
  
    
    mutating func pickNumber(number: Double){
        self.number = number
    }

    mutating func calculation(buttonType : String) -> Double? {
            
        if let n = number {
            switch buttonType {
            case "%":
           return  n / 100
            case "AC":
                return 0
            case "=":
            
                 return twoNumberCalculation(n2: n)
               
            default:
                
                calculation1 = (n1: n, typeOfCalculation2: buttonType)
            }
        

        }
        return nil
    }
    
    
    func twoNumberCalculation(n2: Double) -> Double? {
        
        
        if let n1 = calculation1?.n1,
           let operation = calculation1?.typeOfCalculation2 {


            switch operation {
            case "+":
                return (n1 + n2)
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "÷":
                return n1 / n2
                
            default:
                fatalError("Belirlenemeyen islem turu.")
            }
        }
        return nil
    }
}

