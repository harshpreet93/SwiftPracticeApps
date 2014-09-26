//
//  ViewController.swift
//  TicTacToe
//
//  Created by Harshpreet Singh on 8/19/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit
import CoreData
import Foundation
import QuartzCore

class ViewController: UIViewController {
    
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet var collTest: [UIButton]!
    
    var prevGame: SavedGame?
    var globalContext: NSManagedObjectContext?
    
    @IBAction func resetGame(sender: AnyObject) {
        prevGame!.playerMoveGrid = MoveGrid()
        prevGame!.botMoveGrid = MoveGrid()
        collTest.map( { $0.setTitle("", forState: .Normal) } )
        self.viewDidLoad()
    }
    func refreshViewToReflectModel( currentGame: SavedGame, indexInCollTest: Int) {
        
    }
    func wait() -> Bool {
        sleep(0)
        return true
    }
    @IBAction func zero0(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(0, column: 0)
        if wasMoveMade {
            collTest[0].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[0].setTitle("X", forState: .Normal)
            var interval: NSTimeInterval = NSTimeInterval(1.0)
            wait()
            
            makeBotMoveIfGameIsNotOver()
            
            println(prevGame!.idString)
        }
        
        changeColorOfWinningSequence()
        
        globalContext!.save(nil)
    }

    @IBAction func zero1(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(0, column: 1)
        if wasMoveMade {
            collTest[1].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[1].setTitle("X", forState: .Normal)
            wait()
            makeBotMoveIfGameIsNotOver()
            print(prevGame!.idString)
        }
        changeColorOfWinningSequence()
        globalContext!.save(nil)
    }

    @IBAction func zero2(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(0, column: 2)
        if wasMoveMade {
            collTest[2].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[2].setTitle("X", forState: .Normal)
            wait()
            makeBotMoveIfGameIsNotOver()
        }
        changeColorOfWinningSequence()
        globalContext!.save(nil)
    }
    
    @IBAction func one0(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(1, column: 0)
        if wasMoveMade {
            collTest[3].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[3].setTitle("X", forState: .Normal)
            wait()
            makeBotMoveIfGameIsNotOver()
        }
        changeColorOfWinningSequence()
        globalContext!.save(nil)
    }
    
    @IBAction func one1(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(1, column: 1)
        if wasMoveMade {
            collTest[4].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[4].setTitle("X", forState: .Normal)
            wait()
            makeBotMoveIfGameIsNotOver()
        }
        changeColorOfWinningSequence()
        globalContext!.save(nil)
        
    }
    
    @IBAction func one2(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(1, column: 2)
        if wasMoveMade {
            collTest[5].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[5].setTitle("X", forState: .Normal)
            wait()
            makeBotMoveIfGameIsNotOver()
        }
        changeColorOfWinningSequence()
        globalContext!.save(nil)
    }
    
    @IBAction func two0(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(2, column: 0)
        if wasMoveMade {
            collTest[6].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[6].setTitle("X", forState: .Normal)
            wait()
            makeBotMoveIfGameIsNotOver()
        }
        changeColorOfWinningSequence()
        globalContext!.save(nil)
    }
    
    @IBAction func two1(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(2, column: 1)
        if wasMoveMade {
            collTest[7].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[7].setTitle("X", forState: .Normal)
            wait()
            makeBotMoveIfGameIsNotOver()
        }
        changeColorOfWinningSequence()
        globalContext!.save(nil)
        
    }
    
    @IBAction func two2(sender: AnyObject) {
        var wasMoveMade : Bool = prevGame!.makeMoveIfValid(2, column: 2)
        if wasMoveMade {
            collTest[8].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[8].setTitle("X", forState: .Normal)
            wait()
            makeBotMoveIfGameIsNotOver()
        }
        changeColorOfWinningSequence()
        globalContext!.save(nil)
    }
    
    func setButtonTitleTo0(buttonToBeChanged: UIButton) -> UIButton {
        buttonToBeChanged.setTitle( "0", forState: .Normal )
        return buttonToBeChanged
    }
    
    func getPreviousGame()-> NSArray
    {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let ent = NSEntityDescription.entityForName("Game", inManagedObjectContext: context)
        let request = NSFetchRequest(entityName: "Game")
        
        request.returnsObjectsAsFaults = false
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        return results
    }
    
    func makeBotMoveIfGameIsNotOver() {
        if( !prevGame!.isGameOver()){
            
            var botMove : Point? = prevGame!.botMoveGrid.botMove(prevGame!.playerMoveGrid)
            if( botMove != nil ) {
            prevGame!.botMoveGrid.choosePoint(botMove!.row, column: botMove!.column)
            
            //convert from 2d address to 1d
            var address: Int =  (botMove!.row*3) + botMove!.column
            collTest[address].titleLabel.font = UIFont.systemFontOfSize(20)
            collTest[address].setTitle("0", forState: .Normal)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collTest.map( { $0.layer.borderWidth = 1 } )
        collTest.map( { $0.layer.cornerRadius = 0 })
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        globalContext = context
        let ent = NSEntityDescription.entityForName("Game", inManagedObjectContext: context)
        let request = NSFetchRequest(entityName: "Game")
        
        request.returnsObjectsAsFaults = false
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if(results.count == 0){
            println("0 results")
            //let ent = NSEntityDescription.entityForName("SavedGame", inManagedObjectContext: context)
            var newGame = SavedGame(entity: ent, insertIntoManagedObjectContext: context)
            prevGame = newGame
            context.save(nil)
        }
        else{
            println("there were some results, "+String(results.count))
            var asdf : SavedGame = results[0] as SavedGame
            prevGame = asdf
        }
        
        var testGrid: MoveGrid = MoveGrid()
        
        testGrid.choosePoint(0, column: 0)
        testGrid.choosePoint(0, column: 1)
        println( testGrid.checkPoint( 0, column: 1) )
        println( testGrid.checkPoint( 2, column: 0) )
        println(testGrid.containsWinningMove())
        let winningSeq : [Point]? = testGrid.winningMove()
        
        if winningSeq != nil
        {
            var allPoints : [String] = winningSeq!.map( { $0.toString() } )
        }
    }
    
    func changeColorOfWinningSequence() {
        if(prevGame!.botMoveGrid.hasThisPlayerWon()){
            var winningSeq: [Point]? = prevGame!.botMoveGrid.winningMove()
            for point in winningSeq! {
                var address: Int = (point.row*3)+point.column
                collTest[address].backgroundColor = UIColor.blueColor()
                turnLabel.text = "You Lost!!!"
            }
        }
        
        if(prevGame!.playerMoveGrid.hasThisPlayerWon()){
            var winningSeq: [Point]? = prevGame!.playerMoveGrid.winningMove()
            for point in winningSeq! {
                var address: Int = (point.row*3)+point.column
                collTest[address].backgroundColor = UIColor.blueColor()
                turnLabel.text = "You Won!!!"
            }
        }
    }
    
    func concatTwoStrings(one: String, two: String) -> String{
        return one + "\n" + two
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}