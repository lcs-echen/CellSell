//
//  main.swift
//  CellSell
//
//  Created by Evelyn Chen on 2024-09-17.
//

import Foundation
func getInput(withPrompt prompt: String, minimum: Int?, maximum: Int?) -> Int {
    
    // Loop until a valid value is provided
    while true {
        
        // Prompt the user
        print(prompt)
        
        // Collect the input
        guard let givenInput = readLine() else {
            continue
        }
        
        // Convert to an integer
        guard let givenInteger = Int(givenInput) else {
            continue
        }
        
        // If a lowest value for the integer was specified...
        if let minimumValue = minimum {
            
            // ... then check that the given integer is greater than or equal to the lowest desired value.
            guard givenInteger >= minimumValue else {
                continue
            }
            
        }
        
        // If an highest possible value for the integer was specified...
        if let maximumValue = maximum {
            
            // ... then check that the given integer is less than or equal to the highest desired value.
            guard givenInteger <= maximumValue else {
                continue
            }
            
            
        }
        
        // If we've made it past all the checks, the input is an integer in the desired range of values, so, return it
        return givenInteger
        
    }
    
}

// 1. Input
 
// Get daytime minutes
let dayTimeMinutes = getInput(withPrompt: "Number of daytime minutes? ",
                       minimum: 0,
                       maximum: nil)
 
// Get evening minutes
let eveningMinutes = getInput(withPrompt: "Number of evening minutes? ",
                           minimum: 0,
                           maximum: nil)
 
// Get weekend minutes
let weekendMinutes = getInput(withPrompt: "Number of weekend minutes? ",
                           minimum: 0,
                           maximum: nil)

// 2. Process

// Calculate costs for plan A
var a = 0

// Add daytime cost
if dayTimeMinutes > 100 {
    a += (dayTimeMinutes - 100) * 25
} else {
    a = 0
}


var b = 0
b += eveningMinutes * 15

var c = 0
c += weekendMinutes * 20

var dollar = 0
dollar += (a + b + c)/100
var cents = 0
cents += (a + b + c)%100
var costs = 0
costs += (a + b + c)

// Calculate costs for plan B
var aB = 0
if dayTimeMinutes > 250 {
    aB += (dayTimeMinutes - 250) * 45
} else {
    aB = 0
}


var bB = 0
bB += eveningMinutes * 35

var cB = 0
cB += weekendMinutes * 25

var dollarB = 0
dollarB += (aB + bB + cB)/100
var centsB = 0
centsB += (aB + bB + cB)%100
var costsB = 0
costsB += (aB + bB + cB)

// 3. Output
print("Plan A costs $\(dollar).\(cents)")
print("Plan B costs $\(dollarB).\(centsB)")

if  costs > costsB{
    print("Plan B is cheapest.")
} else if costs < costsB{
    print("Plan A is cheapest.")
} else {
    print("Plan A and Plan B are the same price.")
}




