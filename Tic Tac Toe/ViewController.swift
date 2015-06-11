//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Archit Sood on 2015-05-01.
//  Copyright (c) 2015 Archit Sood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = nots  (0)
    // 2 = cross (x)
    
    //The game starts with nots (0)
    
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //Initial State of the game
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]] //Possible winning comination
    
    var activeState = true //checks if the game is still active
    
    var counter = 0 //Keeps track of total number of moves so far

    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var startAgainButton: UIButton!
    
    @IBAction func startAgain(sender: AnyObject) {
        
        // Reset everything
        activeState = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        counter = 0
        
        var button = UIButton()
        
        for (var i=0 ; i<9 ; i++){
        
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
    }
    
    // The Game--------------------------------------------------------------------------------------------------
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        counter++
        
        if (gameState[sender.tag] == 0 && activeState == true){
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if (activePlayer==1){
        
                image = UIImage(named: "not.png")!
            
                activePlayer = 2
            
            }
            else{
        
                image = UIImage(named: "cross.png")!
            
                activePlayer = 1
            }
        
            sender.setImage(image, forState: .Normal)
            
            
            // Winning Condition-------------------------------------------------------------------------------
            
            for combination in winningCombinations{
                
                //combination[0] represents the first number in smaller arrays
                //combination[1] represents the second number in smaller arrays
                //combination[2] represents the third number in smaller arrays
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                    
                    if (gameState[combination[0]] == 1){
                    
                        //println("Nots (O) Win")
                        gameOverLabel.text = "Nots (O) Win"
                    }
                    else{
                        
                        //println("Crosses (X) Win")
                        gameOverLabel.text = "Crosses (X) Win"
                    }
                    
                    gameOverLabel.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: {()-> Void in
                    
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                    
                    })
                    
                    activeState = false
                    
                }
        
            
            }
            
            //Game Tied------------------------------------------------------------------------------------------
            
            if (counter == 9 && activeState == true){
                
                gameOverLabel.text = "Game Tied"
                
                gameOverLabel.hidden = false
                
                UIView.animateWithDuration(0.5, animations: {()-> Void in
                    
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                    
                })
            
            }
        
        }
    
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Everything is created but not yet displayed on screen
    override func viewDidLayoutSubviews() {
        //Does not work for now dont know why
        //gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
    }


}

