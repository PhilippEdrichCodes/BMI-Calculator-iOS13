//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Philipp Edrich on 28.11.22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var bmiValue: Float?
    
    mutating func calculateBMI(_ height: Float, _ weight: Float){
        self.bmiValue = weight / pow(height, 2)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", locale: .current, self.bmiValue ?? 0.0)
    }
    
}

