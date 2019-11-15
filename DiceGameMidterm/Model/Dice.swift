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

    var description: String {
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
    
    enum Color {
        
        case red
        case blue
        case green
        case purple
        
        static var all = [Color.red, Color.blue, Color.green, Color.purple]
    
    }
    
 
    
    
//    func cardFace() -> String
//    {
//        var shape : String
//        var number : Int
//        
//        switch(self.number)
//        {
//        case .one:
//            number = 1
//        case .two:
//            number = 2
//        case .three:
//            number = 3
//        case .four:
//            number = 4
//        case .five:
//            number = 5
//        case .six:
//            number = 6
//        }
//        
//        switch(self.shape)
//        {
//        case .circle:
//            shape = "⬤"
//        }
//        var numOfShape = ""
//        for _ in 1...number
//        {
//            numOfShape += shape
//            
//        }
//        
//        return numOfShape
//        
//    }
//    
//    func attributedContents() -> NSAttributedString {
//        
//        var strokeColor : Color
//        
//        switch (self.color) {
//        case .purple:
//            strokeColor = Color.purple
//        case .green:
//            strokeColor = Color.green
//        case .red:
//            strokeColor = Color.red
//        case .blue:
//            strokeColor = Color.blue
//        }
//        
//      
//        
//        let attributes : [NSAttributedString.Key: Any] = [.strokeColor : strokeColor, .foregroundColor : 1.0, .strokeWidth : -5.0 ]
//        
//        let attribtext = NSAttributedString(string: self.cardFace(), attributes: attributes)
//        
//        return attribtext
//    }
}
