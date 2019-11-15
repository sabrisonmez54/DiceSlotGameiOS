//
//  Dice.swift
//  DiceGameMidterm
//
//  Created by Sabri Sönmez on 11/13/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import Foundation

struct Dice {
    
    var color: Color
    var number: Number

    var description: String
    {
        return "\(color)\(number)"
    }
    
    enum Number
    {
        case one
        case two
        case three
        case four
        case five
        case six
        
        static var all = [Number.one, Number.two, Number.three, Number.four, Number.five, Number.six]
    }
    
    enum Color
    {
        
        case red
        case blue
        case green
        case purple
        
        static var all = [Color.red, Color.blue, Color.green, Color.purple]
    
    }
}
