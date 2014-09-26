//
//  MoveGrid.swift
//  TicTacToe
//
//  Created by Harshpreet Singh on 8/19/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import Foundation
import Swift

class MoveGrid
{
    var listOfAllPossibleWinningSequences: [ [Point] ]

    init(){
        
        listOfAllPossibleWinningSequences = []
        listOfAllPossibleWinningSequences.append( [Point(row:0, column:0), Point(row:0, column:1), Point(row:0, column:2)] )
        listOfAllPossibleWinningSequences.append( [Point(row:1, column:0), Point(row:1, column:1), Point(row:1, column:2)] )
        listOfAllPossibleWinningSequences.append( [Point(row:2, column:0), Point(row:2, column:1), Point(row:2, column:2)] )
        
        listOfAllPossibleWinningSequences.append( [Point(row:0, column:0), Point(row:1, column:0), Point(row:2, column:0)] )
        listOfAllPossibleWinningSequences.append( [Point(row:0, column:1), Point(row:1, column:1), Point(row:2, column:1)] )
        listOfAllPossibleWinningSequences.append( [Point(row:0, column:2), Point(row:1, column:2), Point(row:2, column:2)] )
        
//        listOfAllPossibleWinningSequences.append( [Point(row:0, column:0), Point(row:0, column:1), Point(row:0, column:2)] )
        listOfAllPossibleWinningSequences.append( [Point(row:2, column:0), Point(row:1, column:1), Point(row:0, column:2)] )
        
        listOfAllPossibleWinningSequences.append( [Point(row:0, column:0), Point(row:1, column:1), Point(row:2, column:2)] )
        
    }
    
    
    
    //returns true if there is a winning move in this grid
    func containsWinningMove()->Bool{
        var onlyWinningSequences = listOfAllPossibleWinningSequences.filter( { self.isWinningSeq($0) } )
        return onlyWinningSequences.count > 0
    }
    
    func winningMove()-> [Point]? {
        var onlyWinningSequences = listOfAllPossibleWinningSequences.filter( { self.isWinningSeq($0) } )
        
        if(onlyWinningSequences.count>0){ return onlyWinningSequences[0] }
        return nil
    }
    
    func isWinningSeq(onePossibleWinningSequence: [Point] ) -> Bool{
        var notChosenPoints = onePossibleWinningSequence.filter( { $0.chosen == false } )
        return notChosenPoints.count==0
    }
    
    func choosePoint(row: Int, column: Int){
        for winningMoveSequence: [Point] in listOfAllPossibleWinningSequences{
            for currPoint: Point in winningMoveSequence{
                if(currPoint.row == row && currPoint.column == column){
                    currPoint.chosen = true
                    println(currPoint.chosen)
                }
            }
        }
    }
    
    
    func checkPoint(row: Int, column: Int)->Bool{
        for winningMoveSequence: [Point] in listOfAllPossibleWinningSequences{
            for currPoint: Point in winningMoveSequence{
                if(currPoint.row == row && currPoint.column == column){
                    return currPoint.chosen
                }
            }
        }
        return false
    }
    
    func allPointsThatAreNotChosen(sequence:[Point]) -> [Point] {
        return sequence.filter( { !$0.chosen } )
    }
    
    func allPossibleMoves(opponentMoveGrid: MoveGrid) -> [Point] {
        var allMovesNotMadeByOpponent: [Point] = []
        var allMovesNotMadeByPlayer: [Point] = []
        var result: [Point] = []
        for i in opponentMoveGrid.listOfAllPossibleWinningSequences{
            for j in i{
                if ( !j.chosen ){
                    if !findInArray(allMovesNotMadeByOpponent, sentinel: j) {
                    allMovesNotMadeByOpponent.append(j)
                    }
                }
            }
        }
        
        for i in self.listOfAllPossibleWinningSequences{
            for j in i{
                if( !j.chosen ) {
                    if !findInArray(allMovesNotMadeByPlayer, sentinel: j) {
                        allMovesNotMadeByPlayer.append(j)
                    }
                }
            }
        }
        
        for i in allMovesNotMadeByOpponent{
            if findInArray(allMovesNotMadeByPlayer, sentinel: i) {
                result.append(i)
            }
        }
        return result
        
    }
    
    func findInArray(sequence: [Point], sentinel: Point)->Bool {
        for point in sequence {
            if(point.row == sentinel.row && point.column == sentinel.column && point.chosen == sentinel.chosen){
                return true
            }
        }
        return false
    }
    func botMove(opponentMoveGrid: MoveGrid) -> Point?{
        var potentialMoves = allPossibleMoves(opponentMoveGrid)
        if( potentialMoves.count > 0) {
            return potentialMoves[0]
        }
        else {
            return nil
        }
    }
    
    //returns true if the address specified by this row and column is not already choosen
    func checkValidMove(row: Int, column: Int) -> Bool{
        return !self.checkPoint(row, column: column)
    }
    
    func getTotalNumberOfChosenPoints()->Int {
        var result: Int = 0
        for i in listOfAllPossibleWinningSequences{
            for j in i{
                if j.chosen == true{
                    result++
                }
            }
        }
        println(result)
        return result
    }
    
    func hasThisPlayerWon()-> Bool {
        for i in listOfAllPossibleWinningSequences{
            if ( i.filter( {$0.chosen==true} ).count == 3 ){
                println("someone has won")
                return true
            }
        }
        return false
    }
    
}