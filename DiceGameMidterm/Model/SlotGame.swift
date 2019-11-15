//
//  SlotGame.swift
//  DiceGameMidterm
//
//  Created by Sabri Sönmez on 11/13/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import Foundation

struct SlotGame {
    
    private(set) var diceCollection = [Dice]()
    var diceInGame = [Dice]()
    var score = 0
    
    //initialize game
    init()
    {
        newGame()
    }
    
    //new game function
    mutating func newGame()
    {
        score = 100
        diceCollection.removeAll()
        diceInGame.removeAll()
        generateDice()
        addDice(numberOfCardsToAdd: 3)
    }
    
    //function to generate all cases of Dice
    private mutating func generateDice() {
        for color in Dice.Color.all {
            for number in Dice.Number.all{
            let dice = Dice(color: color, number: number)
            diceCollection.append(dice)
            diceCollection.shuffle()
            }
        }
    }
    
    //function to add dice to game
    mutating func addDice(numberOfCardsToAdd numberOfDice: Int)
    {
        for _ in 0..<numberOfDice
        {
            addDie()
        }
    }
    
    private mutating func addDie()
    {
        let randomInt = Int.random(in: 0..<diceCollection.count)
        let selectedDice = diceCollection.remove(at: randomInt)
        diceInGame.append(selectedDice)
    }
    
    
    // function to reset game
    mutating func reset() {
        newGame()
    }
    
    //function to spin/roll dice
    mutating func spin() {
        // newGame()
        diceCollection.removeAll()
        diceInGame.removeAll()
        generateDice()
        addDice(numberOfCardsToAdd: 3)
    }
    
    //function to determine score
    mutating func checkMatch(_ selectedDie : [Dice])
    {
        // all dice have the same color
        if (selectedDie[0].color == selectedDie[1].color && selectedDie[0].color == selectedDie[2].color)
        {
            if(selectedDie[1].color == selectedDie[2].color){
                
                //all dice are the same number
                if(selectedDie[0].number == selectedDie[1].number && selectedDie[0].number == selectedDie[2].number)
                {
                    if (selectedDie[1].number == selectedDie[2].number)
                    {
                        score += 300
                    }
                    
                }
                
                // all dice same color but all different number
                if (selectedDie[0].number != selectedDie[1].number && selectedDie[0].number != selectedDie[2].number)
                {
                    if (selectedDie[1].number != selectedDie[2].number)
                    {
                        score += 250
                    }
                    else
                    { //all dice are the same color (numbers are neither same nor all different)
                        score += 200
                    }
                }
            }
        }
        //all dice are different color
        if (selectedDie[0].color != selectedDie[1].color && selectedDie[0].color != selectedDie[2].color)
        {
            if(selectedDie[1].color != selectedDie[2].color){
                //all dice are same number
                if(selectedDie[0].number == selectedDie[1].number && selectedDie[0].number == selectedDie[2].number)
                {
                    score += 150
                }
                //all dice different color and different numbers
                if(selectedDie[0].number != selectedDie[1].number && selectedDie[0].number != selectedDie[2].number)
                {
                    if (selectedDie[1].number != selectedDie[2].number)
                    {
                        score += 100
                    }
                    else
                    { //all dice are the same number (colors are neither all the same nor all different)
                        score += 50
                    }
                }
            }
        }
        // minus 10 for spin
        score -= 10
    }
    
}
