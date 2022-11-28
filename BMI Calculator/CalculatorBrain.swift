//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Philipp Edrich on 28.11.22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(_ height: Float, _ weight: Float){
        let bmiValue = weight / pow(height, 2)
        
        let classification = self.setClassification(bmiValue)
  
        bmi = BMI(value: bmiValue, advice: setAdvice(classification), color: setColor(classification) )
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", locale: .current, self.bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "I don't know your BMI"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.lightGray
    }
    
    func setClassification(_ bmi: Float) -> String {
        
        var classification: String = ""
        
        switch bmi {
        case ..<18.5 : classification = "underweight"
        case 18.5 ..< 25 : classification = "healthy"
        case 25 ..< 30 : classification = "overweight"
        case 30 ..< 40 : classification = "obese"
        default: classification = "extremely_obese"
            
        }
        return classification
    }
    
    func setAdvice(_ classification: String) -> String {
        var advice = ""
                
        switch classification {
        case "underweight":
            advice = "Eat more pies!"
        case "healthy":
            advice = "Fit as a fiddle!"
        case "overweight":
            advice = "Eat less pies!"
        case "obese":
            advice = "Consider a diet and sports!"
        case "extremely_obese":
            advice = "See your doctor!!"
        default:
            advice = "Sure?!"
        }
        
        return advice
    }
    
    func setColor(_ classification: String) -> UIColor {
        var color = UIColor.clear
        
        switch classification {
        case "underweight":
            color = UIColor.cyan
        case "healthy":
            color = UIColor.green
        case "overweight":
            color = UIColor.yellow
        case "obese":
            color = UIColor.orange
        case "extremely_obese":
            color = UIColor.red
        default:
            color = UIColor.lightGray
        }
        
        return color
    }
    
}
