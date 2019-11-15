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
    
    init()
    {
        newGame()
    }
    
    mutating func newGame() {
        score = 100
        diceCollection.removeAll()
        diceInGame.removeAll()
        generateDice()
        addDice(numberOfCardsToAdd: 3)
    }
    
    private mutating func generateDice() {
        for color in Dice.Color.all {
            for number in Dice.Number.all{
            let dice = Dice(color: color, number: number)
            diceCollection.append(dice)
            diceCollection.shuffle()
            }
        }
    }
    
    private mutating func addDie()
    {
        let randomInt = Int.random(in: 0..<diceCollection.count)
        let selectedDice = diceCollection.remove(at: randomInt)
        diceInGame.append(selectedDice)
    }
    
    mutating func checkMatch(_ selectedDie : [Dice]){
        
        if (selectedDie[0].color == selectedDie[1].color && selectedDie[0].color == selectedDie[2].color)
        {
            if(selectedDie[0].number == selectedDie[1].number && selectedDie[0].number == selectedDie[2].number)
            {
                    score += 300
            }else if (selectedDie[0].number != selectedDie[1].number && selectedDie[0].number != selectedDie[2].number)
            {
                    if (selectedDie[1].number != selectedDie[2].number)
                    {
                    score += 250
                    }else {score += 200}
            }
            
        }
        
        if (selectedDie[0].color != selectedDie[1].color && selectedDie[0].color != selectedDie[2].color)
        {
            if(selectedDie[0].number == selectedDie[1].number && selectedDie[0].number == selectedDie[2].number)
            {
                score += 150
            }else if(selectedDie[0].number != selectedDie[1].number && selectedDie[0].number != selectedDie[2].number){
                if (selectedDie[1].number != selectedDie[2].number)
                {
                    score += 100
                }else {score += 50}
            }
        }
        score -= 10
    }
    
    
    mutating func addDice(numberOfCardsToAdd numberOfDice: Int)
    {
        for _ in 0..<numberOfDice
        {
            addDie()
        }
    }
    mutating func reset() {
        newGame()
    }
    
    mutating func spin() {
       // newGame()
        diceCollection.removeAll()
        diceInGame.removeAll()
        generateDice()
        addDice(numberOfCardsToAdd: 3)
    }
}
