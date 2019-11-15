//
//  ViewController.swift
//  DiceGameMidterm
//
//  Created by Sabri Sönmez on 11/13/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = SlotGame()

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewFromModel()
        
    }
    
    func updateViewFromModel() {
       
     let rect = CGRect(x: 0, y: 0, width: self.view1.bounds.width, height: self.view1.bounds.height)
       
       let subView = DiceView(frame: rect)
        subView.color = game.diceInGame[0].color
        subView.number = game.diceInGame[0].number
          
        view1.addSubview(subView)
        
        let subView2 = DiceView(frame: rect)
        
        subView2.color = game.diceInGame[1].color
        subView2.number = game.diceInGame[1].number
        
        view2.addSubview(subView2)
        
        let subView3 = DiceView(frame: rect)
        
        subView3.color = game.diceInGame[2].color
        subView3.number = game.diceInGame[2].number
        
        view3.addSubview(subView3)
        
        scoreLabel.text = "Score: \(game.score)"
        
    }
    
    
    @IBAction func rollBtnPressed(_ sender: Any) {
        if(game.score < 10){
            rollButton.isEnabled = false
            rollButton.setTitle("less than 10 points", for: .normal)
            rollButton.backgroundColor = UIColor.gray
        }
        
        game.checkMatch(game.diceInGame)
        game.spin()
        updateViewFromModel()
        //print(game.score)
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        game.reset()
        updateViewFromModel()
    }
    
}

