//
//  SavedGame.swift
//  TicTacToe
//
//  Created by Harshpreet Singh on 8/19/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit
import CoreData


@objc(SavedGame)
class SavedGame: NSManagedObject {
    
    @NSManaged var zero0: String
    @NSManaged var zero1: String
    @NSManaged var zero2: String
    
    @NSManaged var one0: String
    @NSManaged var one1: String
    @NSManaged var one2: String
    
    @NSManaged var two0: String
    @NSManaged var two1: String
    @NSManaged var two2: String
    
    var idString: String = ""
    
    var playerMoveGrid: MoveGrid = MoveGrid()
    var botMoveGrid: MoveGrid = MoveGrid()
    
    
    func setValueByRowAndColumn(row: Int, column: Int, newVal: String){
        if(row==0){
            if(column==0){ zero0 = newVal }
            if(column==1){ zero1 = newVal }
            if(column==2){ zero2 = newVal }
        }
        if(row==1){
            if(column==0){ one0 = newVal }
            if(column==1){ one1 = newVal }
            if(column==2){ one2 = newVal }
        }
        if(row==2){
            if(column==0){two0 = newVal }
            if(column==1){two1 = newVal }
            if(column==2){two2 = newVal }
        }
    }
    
    func makeMoveIfValid(row: Int, column: Int) -> Bool {
        if ( !isGameOver() && playerMoveGrid.checkValidMove(row, column: column) && botMoveGrid.checkValidMove(row, column: column) ){
            println("Is it Player's turn \(isItPlayersTurn()) ")
            playerMoveGrid.choosePoint(row, column: column)
            setValueByRowAndColumn(row, column: column, newVal: "X")
            
            println("The move is Valid")
            return true
        }
        println("Is it Player's turn \(isItPlayersTurn()) ")
        println("The move is invalid")
        return false
    }
    
    
    func isItPlayersTurn() ->Bool {
        println("The player has made \(playerMoveGrid.getTotalNumberOfChosenPoints()) moves")
        println("The bot has made \(botMoveGrid.getTotalNumberOfChosenPoints()) moves")
        return playerMoveGrid.getTotalNumberOfChosenPoints() <= botMoveGrid.getTotalNumberOfChosenPoints()
    }
    
    func isGameOver() -> Bool {
        if botMoveGrid.hasThisPlayerWon() || playerMoveGrid.hasThisPlayerWon() {
            return true
        }
        return false
    }
}